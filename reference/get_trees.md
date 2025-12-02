# Extract posterior transmission trees

Generates a list of data frames representing posterior transmission
trees from an `outbreaker_chains` object. Each tree contains 'from' and
'to' columns, and may optionally include `kappa`, `t_inf`, and
user-supplied columns.

## Usage

``` r
get_trees(out, kappa = FALSE, t_inf = FALSE, ...)
```

## Arguments

- out:

  A data frame of class `outbreaker_chains`.

- kappa:

  Logical. If `TRUE`, includes `kappa` values in the output. Default is
  `FALSE`.

- t_inf:

  Logical. If `TRUE`, includes infection times (`t_inf`) in the output.
  Default is `FALSE`.

- ...:

  Additional vectors to include as columns in the output. Must be given
  in the same order as used in `outbreaker()`.

## Value

A list of data frames, one per posterior sample. Each data frame has at
least 'from' and 'to' columns.

## Examples

``` r
get_trees(out, id = linelist$id,
               name = linelist$name,
               group = linelist$group,
               onset = linelist$onset)
#> [[1]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6     4  6       4     6        Logan       Shelby        hcw      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    4 10       4    10        Logan      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    4 16       4    16        Logan     Shendell        hcw  patient
#> 17    4 17       4    17        Logan      Michael        hcw  patient
#> 18    5 18       5    18        Emily    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26    4 26       4    26        Logan       Travis        hcw  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           4        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          4        8
#> 11          4        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          4        9
#> 17          4        9
#> 18          6       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          4       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[2]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17   26 17      26    17       Travis      Michael    patient  patient
#> 18    5 18       5    18        Emily    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26    4 26       4    26        Logan       Travis        hcw  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17         10        9
#> 18          6       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          4       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[3]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17   26 17      26    17       Travis      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26    7 26       7    26       Robert       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17         10        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          6       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[4]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17   26 17      26    17       Travis      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26    4 26       4    26        Logan       Travis        hcw  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17         10        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          4       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[5]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17   26 17      26    17       Travis      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26    7 26       7    26       Robert       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17         10        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          6       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[6]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     7  9       7     9       Robert        Tuhfa    patient      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           6        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[7]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[8]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[9]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[10]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[11]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[12]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[13]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[14]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[15]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[16]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18   12 18      12    18      Demarco    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          8       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[17]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18   12 18      12    18      Demarco    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          8       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[18]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[19]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[20]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[21]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[22]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[23]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[24]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[25]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[26]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[27]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[28]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8    12  8      12     8      Demarco        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           8        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[29]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    5 18       5    18        Emily    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          6       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[30]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8    12  8      12     8      Demarco        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           8        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[31]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[32]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[33]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[34]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[35]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[36]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[37]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[38]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[39]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[40]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[41]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[42]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     7  9       7     9       Robert        Tuhfa    patient      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           6        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[43]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     7  9       7     9       Robert        Tuhfa    patient      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           6        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[44]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[45]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[46]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[47]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[48]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[49]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[50]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8    12  8      12     8      Demarco        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           8        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[51]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[52]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[53]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[54]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[55]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[56]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[57]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[58]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[59]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[60]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[61]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[62]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[63]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[64]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[65]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[66]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[67]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[68]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[69]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[70]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[71]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[72]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[73]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[74]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[75]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[76]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[77]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[78]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[79]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[80]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[81]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[82]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[83]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[84]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     7  9       7     9       Robert        Tuhfa    patient      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           6        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[85]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[86]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[87]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[88]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[89]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[90]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[91]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[92]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[93]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[94]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[95]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[96]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[97]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[98]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[99]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[100]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[101]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[102]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[103]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    8 14       8    14        Sahla      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          7        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[104]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[105]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[106]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[107]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[108]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[109]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[110]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     7  9       7     9       Robert        Tuhfa    patient      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           6        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[111]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[112]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[113]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[114]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[115]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[116]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[117]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[118]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[119]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15   12 15      12    15      Demarco        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          8        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[120]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[121]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[122]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[123]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[124]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[125]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[126]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[127]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    5 18       5    18        Emily    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          6       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[128]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[129]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[130]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[131]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     7  9       7     9       Robert        Tuhfa    patient      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           6        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[132]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[133]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[134]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[135]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[136]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[137]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[138]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     7  9       7     9       Robert        Tuhfa    patient      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           6        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[139]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[140]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[141]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[142]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[143]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[144]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8    12  8      12     8      Demarco        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           8        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[145]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8    12  8      12     8      Demarco        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           8        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[146]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15   12 15      12    15      Demarco        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          8        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[147]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[148]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[149]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[150]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[151]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     7  9       7     9       Robert        Tuhfa    patient      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           6        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[152]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[153]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[154]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[155]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    4 17       4    17        Logan      Michael        hcw  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          4        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[156]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[157]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[158]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[159]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[160]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[161]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[162]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[163]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[164]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[165]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[166]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     7  9       7     9       Robert        Tuhfa    patient      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           6        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[167]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[168]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    5 18       5    18        Emily    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          6       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[169]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[170]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[171]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[172]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[173]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[174]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[175]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[176]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     7  9       7     9       Robert        Tuhfa    patient      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           6        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[177]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[178]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[179]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    8 14       8    14        Sahla      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          7        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[180]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[181]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[182]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[183]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[184]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8    12  8      12     8      Demarco        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           8        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[185]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8    12  8      12     8      Demarco        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           8        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[186]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8    12  8      12     8      Demarco        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           8        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[187]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    5 12       5    12        Emily      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          6        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[188]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[189]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[190]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[191]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[192]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[193]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[194]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[195]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[196]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[197]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[198]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[199]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[200]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    7 11       7    11       Robert        Cyril    patient  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    8 15       8    15        Sahla        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          6        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          7        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
#> [[201]]
#>    from to from_id to_id    from_name      to_name from_group to_group
#> 1  <NA>  1    <NA>     1         <NA>     Natashia       <NA>      hcw
#> 2     1  2       1     2     Natashia      Yesenia        hcw  patient
#> 3     2  3       2     3      Yesenia Abdul Kareem    patient      hcw
#> 4  <NA>  4    <NA>     4         <NA>        Logan       <NA>      hcw
#> 5     3  5       3     5 Abdul Kareem        Emily        hcw      hcw
#> 6    10  6      10     6      Avenito       Shelby    patient      hcw
#> 7     4  7       4     7        Logan       Robert        hcw  patient
#> 8     5  8       5     8        Emily        Sahla        hcw      hcw
#> 9     4  9       4     9        Logan        Tuhfa        hcw      hcw
#> 10    9 10       9    10        Tuhfa      Avenito        hcw  patient
#> 11    4 11       4    11        Logan        Cyril        hcw  patient
#> 12    8 12       8    12        Sahla      Demarco        hcw      hcw
#> 13    9 13       9    13        Tuhfa      Kaitlyn        hcw      hcw
#> 14    5 14       5    14        Emily      Vanessa        hcw      hcw
#> 15    5 15       5    15        Emily        Dania        hcw  patient
#> 16    7 16       7    16       Robert     Shendell    patient  patient
#> 17    7 17       7    17       Robert      Michael    patient  patient
#> 18    8 18       8    18        Sahla    Dominique        hcw      hcw
#> 19    9 19       9    19        Tuhfa       Laaiqa        hcw  patient
#> 20   10 20      10    20      Avenito     Cruzelia    patient      hcw
#> 21   11 21      11    21        Cyril         Zaid    patient      hcw
#> 22   11 22      11    22        Cyril        Micah    patient      hcw
#> 23   13 23      13    23      Kaitlyn    Christian        hcw  patient
#> 24   13 24      13    24      Kaitlyn    Stephanie        hcw      hcw
#> 25   13 25      13    25      Kaitlyn       Kavita        hcw      hcw
#> 26   17 26      17    26      Michael       Travis    patient  patient
#> 27   17 27      17    27      Michael        Jacob    patient  patient
#> 28 <NA> 28    <NA>    28         <NA>       Lianne       <NA>      hcw
#> 29   10 29      10    29      Avenito       Mariah    patient  patient
#> 30   13 30      13    30      Kaitlyn         Rabi        hcw      hcw
#>    from_onset to_onset
#> 1          NA        0
#> 2           0        2
#> 3           2        4
#> 4          NA        4
#> 5           4        6
#> 6           8        6
#> 7           4        6
#> 8           6        7
#> 9           4        7
#> 10          7        8
#> 11          4        8
#> 12          7        8
#> 13          7        8
#> 14          6        9
#> 15          6        9
#> 16          6        9
#> 17          6        9
#> 18          7       10
#> 19          7       10
#> 20          8       10
#> 21          8       10
#> 22          8       10
#> 23          8       10
#> 24          8       10
#> 25          8       10
#> 26          9       10
#> 27          9       10
#> 28         NA       10
#> 29          8       11
#> 30          8       11
#> 
```

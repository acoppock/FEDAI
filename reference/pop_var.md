# Population variance

Divides by `N` rather than `N - 1`, which is what a schedule of
potential outcomes calls for: the seven villages in Table 2.1 are the
population, not a sample drawn from one.
[`stats::var()`](https://rdrr.io/r/stats/cor.html) divides by `N - 1`.

## Usage

``` r
pop_var(x, na.rm = FALSE)
```

## Arguments

- x:

  a numeric vector

- na.rm:

  logical. Should missing values be removed? When `FALSE` (the default)
  a single missing value makes the result `NA`, as in
  [`stats::var()`](https://rdrr.io/r/stats/cor.html). When `TRUE`
  missing values are dropped and the divisor is the number of values
  that remain.

## Examples

``` r
x <- c(1, 2, 3, 4)
pop_var(x) # divides by n
#> [1] 1.25

# For comparision
var(x) # divides by n - 1
#> [1] 1.666667

pop_var(c(1, 2, NA, 4)) # NA
#> [1] NA
pop_var(c(1, 2, NA, 4), na.rm = TRUE) # divides by 3
#> [1] 1.555556
```

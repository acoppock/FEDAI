# Population covariance

Divides by `N` rather than `N - 1`. See
[`pop_var()`](https://alexandercoppock.com/FEDAI/reference/pop_var.md).

## Usage

``` r
pop_cov(x, y, na.rm = FALSE)
```

## Arguments

- x:

  a numeric vector

- y:

  a numeric vector

- na.rm:

  logical. Should missing values be removed? When `TRUE` a pair is
  dropped when either element is missing, and the divisor is the number
  of complete pairs.

## Examples

``` r
x <- c(1, 2, 3, 4)
y <- c(4, 3, 2, 1)
pop_cov(x, y)
#> [1] -1.25
# for comparison
cov(x, y)
#> [1] -1.666667
```

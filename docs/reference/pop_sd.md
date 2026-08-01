# Population standard deviation

Divides by `N` rather than `N - 1`. See
[`pop_var()`](https://alexandercoppock.com/FEDAI/reference/pop_var.md).

## Usage

``` r
pop_sd(x, na.rm = FALSE)
```

## Arguments

- x:

  a numeric vector

- na.rm:

  logical. Should missing values be removed?

## Examples

``` r
x <- c(1, 2, 3, 4)
pop_sd(x) # divides by n
#> [1] 1.118034

# For comparision
sd(x) # divides by n - 1
#> [1] 1.290994
```

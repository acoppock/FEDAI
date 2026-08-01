# Test for a difference in outcome variances between treatment arms

Computes the difference in sample variances between treated and control
units and tests the null that the two variances are equal. Used in
Chapter 9 as an indirect test of the null of constant treatment effects:
under constant effects the two schedules of potential outcomes have
equal variances, so a difference in variances is evidence of
heterogeneity.

## Usage

``` r
difference_in_variances(data)
```

## Arguments

- data:

  A data frame with columns `Y` (outcome) and `Z` (binary treatment
  indicator, 1 = treated).

## Value

A one-row
[`tibble::tibble()`](https://tibble.tidyverse.org/reference/tibble.html)
with columns `estimate` (Var(Y\|Z=1) - Var(Y\|Z=0)) and `p.value`.

## Which test this is

[`stats::var.test()`](https://rdrr.io/r/stats/var.test.html), the
classical F test for the ratio of two variances. The F test assumes the
outcome is normally distributed within each arm and is sensitive to
departures from that assumption, so a small p-value can reflect kurtosis
rather than a difference in dispersion. Levene- and Bonett-type tests
trade power for robustness against exactly that.

This function previously called `DescTools::VarTest(method = "bonett")`,
which documented a Bonett test that never ran: `VarTest()` takes no
`method` argument in its two-sample branch, so the argument fell into
`...` and the F test was performed. Calling
[`stats::var.test()`](https://rdrr.io/r/stats/var.test.html) directly
gives the same numbers under a name that describes them.

The signature takes `data` first and returns one row, which is what
[`DeclareDesign::label_estimator()`](https://declaredesign.org/r/declaredesign/reference/declare_estimator.html)
expects of an estimator handler.

## Examples

``` r
dat <- data.frame(Y = c(rnorm(50, sd = 1), rnorm(50, sd = 2)),
                  Z = rep(0:1, each = 50))
difference_in_variances(dat)
#> # A tibble: 1 × 2
#>   estimate   p.value
#>      <dbl>     <dbl>
#> 1     2.95 0.0000182
```

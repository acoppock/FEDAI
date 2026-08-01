# The true standard error of a two-arm experiment under complete random assignment

Equation 3.4 of FEDAI. The standard error depends on the variance of
both schedules of potential outcomes and on their covariance, which is
why it cannot be computed from observed data: no unit reveals both of
its potential outcomes.

## Usage

``` r
equation_3.4(var_Y0, var_Y1, cov_Y0_Y1, N, m)
```

## Arguments

- var_Y0:

  the variance of the untreated potential outcomes

- var_Y1:

  the variance of the treated potential outcomes

- cov_Y0_Y1:

  the covariance of the treated and untreated potential outcomes

- N:

  the number of units in the experiment

- m:

  the number of units assigned to treatment

## Value

A numeric scalar, the standard error of the difference-in-means
estimator.

## Examples

``` r
var_Y0 <- pop_var(table_2_1$Y_Z_0)
var_Y1 <- pop_var(table_2_1$Y_Z_1)
cov_Y0_Y1 <- pop_cov(table_2_1$Y_Z_0, table_2_1$Y_Z_1)

equation_3.4(var_Y0 = var_Y0,
             var_Y1 = var_Y1,
             cov_Y0_Y1 = cov_Y0_Y1,
             N = 7,
             m = 2)
#> [1] 4.603311
```

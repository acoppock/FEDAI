# Simulate Bayesian posterior distributions across experimental sample sizes

Draws `sims` experimental results from a normal data-generating process
with true PATE `tau` and possible sampling bias, computes the posterior
mean for each draw using
[`posterior_mean_fn()`](https://alexandercoppock.com/FEDAI/reference/posterior_mean_fn.md),
and returns a tidy tibble. Used in Chapter 11 to illustrate how
sampling-bias uncertainty limits learning even as sample size grows.

## Usage

``` r
simulate_posteriors(
  N,
  sigma_B,
  sims = 5000,
  tau = 0.1,
  sigma_Y = 1,
  sigma_g = 0.2,
  g = 0,
  beta = 0
)
```

## Arguments

- N:

  Integer. Experimental sample size.

- sigma_B:

  Numeric. Standard deviation of the sampling-bias distribution. Set to
  0 for no bias uncertainty.

- sims:

  Integer. Number of simulated experimental results. Default 5000.

- tau:

  Numeric. True PATE. Default 0.1.

- sigma_Y:

  Numeric. Outcome standard deviation. Default 1.

- sigma_g:

  Numeric. Prior SD on the PATE. Default 0.2.

- g:

  Numeric. Prior mean on the PATE. Default 0.

- beta:

  Numeric. Prior mean on sampling bias. Default 0.

## Value

A
[`tibble::tibble()`](https://tibble.tidyverse.org/reference/tibble.html)
with columns `N`, `sigma_B`, and `posterior_mean`.

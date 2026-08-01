# Compute the Bayesian posterior mean given a normal prior and experimental result

Applies the precision-weighted updating formula from FEDAI Equations
11.2–11.4. The posterior mean is a weighted average of the prior mean
`g` and the bias-corrected experimental estimate `x_e`, where the
weights depend on prior variance, sampling-bias variance, and sampling
variance.

## Usage

``` r
posterior_mean_fn(x_e, g, sigma_g, sigma_B, sigma_x)
```

## Arguments

- x_e:

  Numeric. Experimental estimate(s).

- g:

  Numeric. Prior mean on the PATE.

- sigma_g:

  Numeric. Prior standard deviation on the PATE.

- sigma_B:

  Numeric. Standard deviation of the sampling-bias distribution.

- sigma_x:

  Numeric. Standard error of the experimental estimate.

## Value

Numeric vector of posterior means, same length as `x_e`.

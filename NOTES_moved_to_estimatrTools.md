# What moved to estimatrTools

Helper functions that are about estimation rather than about the book
now live in [estimatrTools](https://github.com/acoppock/estimatrTools).
None of them are re-exported from this package, so book code that uses
them should load that package directly.

## The double-LASSO functions

[`lasso_select_covariates()`](https://alexandercoppock.com/estimatrTools/reference/lasso_select_covariates.html)
and `lm_double_lasso()` used to live in `R/double_lasso.R`.

``` r

library(estimatrTools)

lasso_select_covariates(Y ~ Z, covariates = ~ X1 + X2, data = dat)
lm_lin_lasso(Y ~ Z, covariates = ~ X1 + X2, data = dat)
```

`lm_double_lasso()` is gone rather than aliased. It named the selection
method, which no longer identifies anything: three estimators in
estimatrTools share double-LASSO selection and differ in how they fit.
Its replacement is
[`lm_lin_lasso()`](https://alexandercoppock.com/estimatrTools/reference/lm_lin_lasso.html),
which names the estimator.

The version that lived here carried three defects the package fixes:
unusable candidate columns were not dropped before the complete-case
filter, so a single all-NA candidate silently disabled selection
entirely; selected model-matrix columns were mapped back to source
covariates with a bare `startsWith`, which over-includes whenever one
covariate name is a prefix of another; and
[`set.seed()`](https://rdrr.io/r/base/Random.html) was called without
restoring the stream, so running the book’s code silently repositioned
the reader’s random number generator.

## The bootstrap

`lm_bootstrap()` and `tidy.lm_bootstrap()` used to live in
`R/bootstrap.R`.

``` r

library(estimatrTools)

boot_fit <- lm_bootstrap(Y ~ Z + X, data = dat, times = 1000)
broom::tidy(boot_fit)
```

The interface is unchanged apart from `boot_results`, whose `id` column
(rsample’s “Bootstrap001”) is now an integer `replicate`. Two things
changed underneath. Resampling is base R rather than rsample, dplyr,
purrr, tidyr and rlang, which is why this package no longer imports any
of them. And arguments passed through `...` are forwarded to `lm_robust`
unevaluated instead of being evaluated against the **original** data
first: a `weights = w` used to be paired with the resampled rows in the
order the original data held it, rather than the weight belonging to the
row that was drawn.

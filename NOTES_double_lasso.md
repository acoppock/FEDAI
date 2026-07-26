# Where the double-LASSO functions went

`lasso_select_covariates()` and `lm_double_lasso()` used to live in
`R/double_lasso.R`. They now live in
[estimatrTools](https://github.com/acoppock/estimatrTools) and are **not**
re-exported from this package. Book code that uses them should load that
package directly:

```r
library(estimatrTools)

lasso_select_covariates(Y ~ Z, covariates = ~ X1 + X2, data = dat)
lm_lin_lasso(Y ~ Z, covariates = ~ X1 + X2, data = dat)
```

`lm_double_lasso()` is gone rather than aliased. It named the selection method,
which no longer identifies anything: three estimators in estimatrTools share
double-LASSO selection and differ in how they fit. Its replacement is
`lm_lin_lasso()`, which names the estimator.

The version that lived here carried three defects the package fixes: unusable
candidate columns were not dropped before the complete-case filter, so a single
all-NA candidate silently disabled selection entirely; selected model-matrix
columns were mapped back to source covariates with a bare `startsWith`, which
over-includes whenever one covariate name is a prefix of another; and
`set.seed()` was called without restoring the stream, so running the book's code
silently repositioned the reader's random number generator.

set.seed(42)
n <- 300
x <- matrix(rnorm(n * 10), n, 10)
colnames(x) <- paste0("x", 1:10)
d <- rbinom(n, 1, 0.5)
# x1 strongly predicts Y; x2-x10 are noise
y <- 0.5 * d + 2 * x[, 1] + rnorm(n)
dat <- data.frame(y = y, d = d, x)

test_that("lm_double_lasso returns an lm_robust/lm_lin object", {
  fit <- lm_double_lasso(y ~ d, covariates = ~ x1 + x2 + x3 + x4 + x5,
                         data = dat)
  expect_true(inherits(fit, "lm_robust") || inherits(fit, "iv_robust"))
  td <- broom::tidy(fit)
  expect_true("d" %in% td$term)
})

test_that("lm_double_lasso estimate is close to true ATE", {
  fit <- lm_double_lasso(y ~ d,
                         covariates = ~ x1 + x2 + x3 + x4 + x5 +
                           x6 + x7 + x8 + x9 + x10,
                         data = dat)
  est <- broom::tidy(fit) |> dplyr::filter(term == "d") |> dplyr::pull(estimate)
  expect_true(abs(est - 0.5) < 0.15)
})

test_that("lm_double_lasso reduces SE vs plain OLS when k is large", {
  set.seed(7)
  n2 <- 500
  xk <- matrix(rnorm(n2 * 10), n2, 10)
  colnames(xk) <- paste0("x", seq_len(10))
  d2 <- rbinom(n2, 1, 0.5)
  y2 <- 0.5 * d2 + 2 * xk[, 1] + rnorm(n2)
  dat2 <- data.frame(y = y2, d = d2, xk)

  fit_lasso <- lm_double_lasso(y ~ d,
                               covariates = ~ x1 + x2 + x3 + x4 + x5 +
                                 x6 + x7 + x8 + x9 + x10,
                               data = dat2)
  fit_ols <- estimatr::lm_robust(
    y ~ d + x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10, data = dat2
  )

  se_lasso <- broom::tidy(fit_lasso) |> dplyr::filter(term == "d") |> dplyr::pull(std.error)
  se_ols   <- broom::tidy(fit_ols)   |> dplyr::filter(term == "d") |> dplyr::pull(std.error)
  expect_lt(se_lasso, se_ols)
})

test_that("lm_double_lasso falls back to lm_robust when no covariates selected", {
  # With N=5 the lasso_nonzero guard returns early; nothing is selected
  fit <- lm_double_lasso(y ~ d, covariates = ~ x1 + x2, data = dat[1:5, ])
  expect_true(inherits(fit, "lm_robust") || inherits(fit, "iv_robust"))
})

test_that("lasso_select_covariates returns a formula", {
  sel <- lasso_select_covariates(y ~ d, covariates = ~ x1 + x2 + x3 + x4 + x5,
                                 data = dat)
  expect_true(inherits(sel, "formula"))
})

test_that("lasso_select_covariates selects x1 (the signal covariate)", {
  sel <- lasso_select_covariates(y ~ d, covariates = ~ x1 + x2 + x3 + x4 + x5,
                                 data = dat)
  expect_true("x1" %in% all.vars(sel))
})

#' Post-double-selection LASSO covariate selector (Lin-aware)
#'
#' Selects covariates for use with [estimatr::lm_lin()] via double-selection
#' LASSO (Belloni, Chernozhukov & Hansen 2014). Lin-aware: runs LASSO of the
#' outcome on covariates separately in each treatment arm so that covariates
#' useful for either main effects or treatment interactions are captured.
#' Double-selection: also regresses each arm indicator on the covariates so
#' that confounders predictive of assignment are included. Regularisation uses
#' the one-SE rule (`lambda.1se`) via [glmnet::cv.glmnet()], which is more
#' conservative than `lambda.min` and avoids over-selection (important because
#' `lm_lin` costs one parameter *per arm* for each selected covariate).
#'
#' @param formula Two-sided formula `Y ~ D`.
#' @param covariates One-sided formula or bare expression of candidate
#'   covariates (e.g. `~ X1 + X2` or `X1 + X2`), matching the `covariates`
#'   argument of [estimatr::lm_lin()].
#' @param data A data frame.
#' @param seed Integer seed for reproducibility (default 999).
#'
#' @return A one-sided formula of selected column names, or `~1` when no
#'   covariates are selected.
#'
#' @references Belloni, A., Chernozhukov, V., & Hansen, C. (2014). Inference on
#'   treatment effects after selection among high-dimensional controls.
#'   *Review of Economic Studies*, 81(2), 608--650.
#'
#' @importFrom glmnet cv.glmnet coef.cv.glmnet
#' @importFrom stats reformulate model.matrix complete.cases var
#' @export
lasso_select_covariates <- function(formula, covariates, data, seed = 999) {
  cov_expr <- substitute(covariates)
  covariate_cols <- if (inherits(cov_expr, "formula")) {
    all.vars(cov_expr)
  } else {
    all.vars(as.formula(paste("~", deparse1(cov_expr))))
  }

  outcome   <- as.character(formula[[2]])
  treatment <- as.character(formula[[3]])

  df <- data[complete.cases(data[, c(outcome, treatment, covariate_cols)]), ]

  y <- df[[outcome]]
  z <- df[[treatment]]

  X <- model.matrix(reformulate(covariate_cols), data = df)[, -1, drop = FALSE]
  X <- scale(X)

  lasso_nonzero <- function(x_mat, response) {
    if (nrow(x_mat) < 10 || ncol(x_mat) == 0) return(character(0))
    keep <- apply(x_mat, 2, function(x) var(x, na.rm = TRUE) > 0)
    keep[is.na(keep)] <- FALSE
    x_mat <- x_mat[, keep, drop = FALSE]
    if (ncol(x_mat) == 0) return(character(0))
    ok       <- complete.cases(x_mat)
    x_mat    <- x_mat[ok, , drop = FALSE]
    response <- response[ok]
    if (nrow(x_mat) < 10) return(character(0))
    if (ncol(x_mat) == 1) return(colnames(x_mat))
    fit    <- cv.glmnet(x_mat, response, alpha = 1, family = "gaussian")
    coeffs <- as.matrix(coef(fit, s = "lambda.1se"))
    rownames(coeffs)[coeffs[, 1] != 0 & rownames(coeffs) != "(Intercept)"]
  }

  set.seed(seed)
  arms <- unique(z)

  selected_y <- arms |>
    lapply(\(arm) lasso_nonzero(X[z == arm, , drop = FALSE], y[z == arm])) |>
    unlist() |>
    unique()

  selected_z <- arms |>
    lapply(\(arm) lasso_nonzero(X, as.integer(z == arm))) |>
    unlist() |>
    unique()

  selected <- union(selected_y, selected_z)

  original_cols <- Filter(
    \(col) any(startsWith(selected, col)),
    covariate_cols
  )

  if (length(original_cols) == 0) {
    message("lasso_select_covariates: no covariates selected.")
    return(~1)
  }

  reformulate(original_cols)
}


#' Lin estimator with automatic LASSO covariate selection
#'
#' Wraps [estimatr::lm_lin()] with automatic covariate selection via
#' post-double-selection LASSO ([lasso_select_covariates()]). The `covariates`
#' argument specifies the *candidate pool*; the LASSO trims it before passing
#' the selected subset to `lm_lin`. Falls back to [estimatr::lm_robust()] when
#' no covariates are selected (equivalent to a difference-in-means estimator).
#'
#' The function signature is identical to [estimatr::lm_lin()] so it can be
#' used as a drop-in replacement anywhere `lm_lin` would appear, including
#' inside [DeclareDesign::declare_estimator()].
#'
#' @param formula Two-sided formula `Y ~ D`.
#' @param covariates Candidate covariates: a one-sided formula (`~ X1 + X2`) or
#'   a bare expression (`X1 + X2`).
#' @param data A data frame.
#' @param weights Optional weights vector.
#' @param subset Optional subset expression.
#' @param clusters Optional clusters vector for cluster-robust SEs.
#' @param se_type Standard-error type passed to [estimatr::lm_lin()].
#' @param ci Logical; compute confidence intervals (default `TRUE`).
#' @param alpha Significance level for confidence intervals (default `0.05`).
#' @param return_vcov Logical; return variance-covariance matrix (default
#'   `TRUE`).
#' @param try_cholesky Logical; try Cholesky decomposition for speed (default
#'   `FALSE`).
#' @param lasso_args Named list of additional arguments passed to
#'   [lasso_select_covariates()] (e.g. `list(seed = 42)`).
#'
#' @return An [estimatr::lm_lin()] or [estimatr::lm_robust()] fit object.
#'   Use [broom::tidy()] to extract results.
#'
#' @references Belloni, A., Chernozhukov, V., & Hansen, C. (2014). Inference on
#'   treatment effects after selection among high-dimensional controls.
#'   *Review of Economic Studies*, 81(2), 608--650.
#'
#' @examples
#' set.seed(1)
#' n <- 200
#' x <- matrix(rnorm(n * 20), n, 20)
#' colnames(x) <- paste0("x", 1:20)
#' d <- rbinom(n, 1, 0.5)
#' y <- 0.5 * d + x[, 1] * 0.8 + rnorm(n)
#' dat <- data.frame(y = y, d = d, x)
#' lm_double_lasso(y ~ d, covariates = ~ x1 + x2 + x3, data = dat)
#'
#' @importFrom estimatr lm_lin lm_robust
#' @importFrom stats reformulate
#' @export
lm_double_lasso <- function(
    formula,
    covariates,
    data,
    weights      = NULL,
    subset       = NULL,
    clusters     = NULL,
    se_type      = NULL,
    ci           = TRUE,
    alpha        = 0.05,
    return_vcov  = TRUE,
    try_cholesky = FALSE,
    lasso_args   = list()
) {
  cov_expr <- substitute(covariates)

  selected <- do.call(
    lasso_select_covariates,
    c(
      list(
        formula    = formula,
        covariates = eval(
          if (inherits(cov_expr, "formula")) cov_expr
          else as.formula(paste("~", deparse1(cov_expr)))
        ),
        data       = data
      ),
      lasso_args
    )
  )

  if (length(all.vars(selected)) == 0) {
    return(lm_robust(
      formula      = formula,
      data         = data,
      weights      = weights,
      subset       = subset,
      clusters     = clusters,
      se_type      = se_type,
      ci           = ci,
      alpha        = alpha,
      return_vcov  = return_vcov,
      try_cholesky = try_cholesky
    ))
  }

  lm_lin(
    formula      = formula,
    covariates   = selected,
    data         = data,
    weights      = weights,
    subset       = subset,
    clusters     = clusters,
    se_type      = se_type,
    ci           = ci,
    alpha        = alpha,
    return_vcov  = return_vcov,
    try_cholesky = try_cholesky
  )
}

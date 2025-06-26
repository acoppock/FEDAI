#' Bootstrap linear model estimates using lm_robust
#'
#' This function runs bootstrap resampling to estimate uncertainty around
#' regression coefficients using `estimatr::lm_robust` with `se_type = "none"`.
#'
#' @param formula A formula specifying the model.
#' @param data A data frame.
#' @param times Number of bootstrap replications. Default is 1000.
#' @param ... Additional arguments passed to `estimatr::lm_robust`.
#'
#' @return A data frame with class `lm_bootstrap`, containing bootstrap estimates of model coefficients.
#'
#' @examples
#' boot_out <- lm_bootstrap(mpg ~ wt + hp, data = mtcars, times = 100)
#' tidy(boot_out, alpha = 0.05)
#'
#' @importFrom dplyr mutate select
#' @importFrom purrr map
#' @importFrom tidyr unnest
#' @importFrom broom tidy
#' @importFrom rsample bootstraps analysis
#' @importFrom rlang enquos eval_tidy
#' @export
lm_bootstrap <- function(formula, data, times = 1000, ...) {
  dots <- rlang::enquos(...)

  boot_samples <- rsample::bootstraps(data, times = times)

  boot_results <- boot_samples |>
    dplyr::mutate(
      model = purrr::map(splits, function(s) {
        dat <- rsample::analysis(s)
        args <- purrr::map(dots, rlang::eval_tidy, data = dat)
        do.call(estimatr::lm_robust, c(list(formula = formula, data = dat, se_type = "none"), args))
      }),
      coefs = purrr::map(model, broom::tidy)
    ) |>
    dplyr::select(id, coefs) |>
    tidyr::unnest(coefs)

  class(boot_results) <- c("lm_bootstrap", class(boot_results))
  return(boot_results)
}

#' Summarize bootstrap estimates from lm_bootstrap
#'
#' Summarizes the output of `lm_bootstrap` by calculating mean estimates,
#' bootstrap standard errors, and confidence intervals for each model term.
#'
#' @param x An object of class `lm_bootstrap`.
#' @param alpha Significance level for confidence intervals (e.g. 0.05 for 95\% CI).
#' @param ... Ignored.
#'
#' @return A data frame with columns:
#' \describe{
#'   \item{term}{Model term}
#'   \item{estimate}{Mean bootstrap estimate}
#'   \item{std.error}{Bootstrap standard deviation}
#'   \item{conf.low}{Lower confidence bound}
#'   \item{conf.high}{Upper confidence bound}
#' }
#'
#' @examples
#' boot_out <- lm_bootstrap(mpg ~ wt + hp, data = mtcars, times = 100)
#' tidy(boot_out, alpha = 0.05)
#'
#' @importFrom dplyr group_by summarize select
#' @export
tidy.lm_bootstrap <- function(x, alpha = 0.05, ...) {
  x |>
    dplyr::group_by(term) |>
    dplyr::summarize(
      std.error = sd(estimate),
      conf.low = quantile(estimate, alpha / 2),
      conf.high = quantile(estimate, 1 - alpha / 2),
      estimate = mean(estimate),
      .groups = "drop"
    ) |>
    dplyr::select(term, estimate, std.error, conf.low, conf.high)
}

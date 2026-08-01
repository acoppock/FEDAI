#' Test for a difference in outcome variances between treatment arms
#'
#' Computes the difference in sample variances between treated and control units
#' and tests the null that the two variances are equal. Used in Chapter 9 as an
#' indirect test of the null of constant treatment effects: under constant
#' effects the two schedules of potential outcomes have equal variances, so a
#' difference in variances is evidence of heterogeneity.
#'
#' @section Which test this is:
#' [stats::var.test()], the classical F test for the ratio of two variances.
#' The F test assumes the outcome is normally distributed within each arm and is
#' sensitive to departures from that assumption, so a small p-value can reflect
#' kurtosis rather than a difference in dispersion. Levene- and Bonett-type
#' tests trade power for robustness against exactly that.
#'
#' This function previously called `DescTools::VarTest(method = "bonett")`, which
#' documented a Bonett test that never ran: `VarTest()` takes no `method`
#' argument in its two-sample branch, so the argument fell into `...` and the F
#' test was performed. Calling [stats::var.test()] directly gives the same
#' numbers under a name that describes them.
#'
#' The signature takes `data` first and returns one row, which is what
#' `DeclareDesign::label_estimator()` expects of an estimator handler.
#'
#' @param data A data frame with columns `Y` (outcome) and `Z` (binary
#'   treatment indicator, 1 = treated).
#'
#' @return A one-row [tibble::tibble()] with columns `estimate`
#'   (Var(Y|Z=1) - Var(Y|Z=0)) and `p.value`.
#'
#' @examples
#' dat <- data.frame(Y = c(rnorm(50, sd = 1), rnorm(50, sd = 2)),
#'                   Z = rep(0:1, each = 50))
#' difference_in_variances(dat)
#'
#' @importFrom tibble tibble
#' @importFrom stats var var.test
#' @export
difference_in_variances <- function(data) {
  missing_cols <- setdiff(c("Y", "Z"), names(data))
  if (length(missing_cols) > 0) {
    stop("difference_in_variances: data has no column named ",
         paste(missing_cols, collapse = " or "), ".", call. = FALSE)
  }
  treatment <- data$Y[data$Z == 1]
  control <- data$Y[data$Z == 0]
  fit <- var.test(treatment, control)
  tibble::tibble(
    estimate = var(treatment) - var(control),
    p.value = fit$p.value
  )
}

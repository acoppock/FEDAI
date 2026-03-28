#' Test for a difference in outcome variances between treatment arms
#'
#' Computes the difference in sample variances between treated and control
#' units and tests for equality using Bonett's method via
#' [DescTools::VarTest()]. Used in Chapter 9 to diagnose whether a treatment
#' changes the dispersion of outcomes, not just their mean.
#'
#' @param data A data frame with columns `Y` (outcome) and `Z` (binary
#'   treatment indicator, 1 = treated).
#'
#' @return A one-row [tibble::tibble()] with columns `estimate`
#'   (Var(Y|Z=1) - Var(Y|Z=0)) and `p.value`.
#'
#' @examples
#' \dontrun{
#'   dat <- data.frame(Y = c(rnorm(50, sd = 1), rnorm(50, sd = 2)), Z = rep(0:1, each = 50))
#'   difference_in_variances(dat)
#' }
#'
#' @importFrom tibble tibble
#' @importFrom stats var
#' @export
difference_in_variances <- function(data) {
  if (!requireNamespace("DescTools", quietly = TRUE)) {
    stop("Package 'DescTools' is required. Install it with install.packages('DescTools').")
  }
  treatment <- data$Y[data$Z == 1]
  control   <- data$Y[data$Z == 0]
  fit <- DescTools::VarTest(treatment, control, method = "bonett")
  tibble::tibble(
    estimate = var(treatment) - var(control),
    p.value  = fit$p.value
  )
}

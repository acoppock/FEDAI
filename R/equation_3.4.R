#' The true standard error of a two-arm experiment under complete random assignment
#'
#' Equation 3.4 of FEDAI. The standard error depends on the variance of both
#' schedules of potential outcomes and on their covariance, which is why it
#' cannot be computed from observed data: no unit reveals both of its potential
#' outcomes.
#'
#' @param var_Y0 the variance of the untreated potential outcomes
#' @param var_Y1 the variance of the treated potential outcomes
#' @param cov_Y0_Y1 the covariance of the treated and untreated potential outcomes
#' @param N the number of units in the experiment
#' @param m the number of units assigned to treatment
#'
#' @return A numeric scalar, the standard error of the difference-in-means
#'   estimator.
#'
#' @export
#'
#' @examples
#' var_Y0 <- pop_var(table_2_1$Y_Z_0)
#' var_Y1 <- pop_var(table_2_1$Y_Z_1)
#' cov_Y0_Y1 <- pop_cov(table_2_1$Y_Z_0, table_2_1$Y_Z_1)
#'
#' equation_3.4(var_Y0 = var_Y0,
#'              var_Y1 = var_Y1,
#'              cov_Y0_Y1 = cov_Y0_Y1,
#'              N = 7,
#'              m = 2)
equation_3.4 <- function(var_Y0, var_Y1, cov_Y0_Y1, N, m) {
  sqrt(1 / (N - 1) * ((m * var_Y0) / (N - m) + ((N - m) * var_Y1) / m + 2 * cov_Y0_Y1))
}

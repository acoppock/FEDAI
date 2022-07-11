

#' The true standard error of a two-arm experiment under complete random assignment
#'
#' @param var_Y0 the variance of the untreated potential outcomes
#' @param var_Y1 the variance of the treated potential outcomes
#' @param cov_Y0_Y1 the covariance of the treated and untreated potential outcomes
#' @param N the number of units in the experiment
#' @param m the number of units assigned to treatment
#'
#' @export
#'
#' @examples
#' var_Y0 <- pop_var(table_2.1$Y_Z_0)
#' var_Y1 <- pop_var(table_2.1$Y_Z_1)
#' cov_Y0_Y1 <- pop_cov(table_2.1$Y_Z_0, table_2.1$Y_Z_1)
#'
#' equation_3.4(var_Y0 = var_Y0,
#'              var_Y1 = var_Y1,
#'              cov_Y0_Y1 = cov_Y0_Y1,
#'              N = 7,
#'              m = 2)
#'
equation_3.4 <-
  function(var_Y0, var_Y1, cov_Y0_Y1, N, m){
    sqrt(1/(N-1)*((m*var_Y0)/(N-m) + ((N-m)*var_Y1)/m + 2*cov_Y0_Y1))
  }


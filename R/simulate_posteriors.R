#' Compute the Bayesian posterior mean given a normal prior and experimental result
#'
#' Applies the precision-weighted updating formula from FEDAI Equations 11.2--11.4.
#' The posterior mean is a weighted average of the prior mean `g` and the
#' bias-corrected experimental estimate `x_e`, where the weights depend on prior
#' variance, sampling-bias variance, and sampling variance.
#'
#' @param x_e Numeric. Experimental estimate(s).
#' @param g Numeric. Prior mean on the PATE.
#' @param sigma_g Numeric. Prior standard deviation on the PATE.
#' @param sigma_B Numeric. Standard deviation of the sampling-bias distribution.
#' @param sigma_x Numeric. Standard error of the experimental estimate.
#'
#' @return Numeric vector of posterior means, same length as `x_e`.
#'
#' @export
posterior_mean_fn <- function(x_e, g, sigma_g, sigma_B, sigma_x) {
  sigma_post_sq <- 1 / (1 / sigma_g^2 + 1 / (sigma_B^2 + sigma_x^2))
  p1 <- sigma_post_sq / sigma_g^2
  p2 <- sigma_post_sq / (sigma_B^2 + sigma_x^2)
  p1 * g + p2 * x_e
}

#' Simulate Bayesian posterior distributions across experimental sample sizes
#'
#' Draws `sims` experimental results from a normal data-generating process with
#' true PATE `tau` and possible sampling bias, computes the posterior mean for
#' each draw using [posterior_mean_fn()], and returns a tidy tibble. Used in
#' Chapter 11 to illustrate how sampling-bias uncertainty limits learning even
#' as sample size grows.
#'
#' @param N Integer. Experimental sample size.
#' @param sigma_B Numeric. Standard deviation of the sampling-bias distribution.
#'   Set to 0 for no bias uncertainty.
#' @param sims Integer. Number of simulated experimental results. Default 5000.
#' @param tau Numeric. True PATE. Default 0.1.
#' @param sigma_Y Numeric. Outcome standard deviation. Default 1.
#' @param sigma_g Numeric. Prior SD on the PATE. Default 0.2.
#' @param g Numeric. Prior mean on the PATE. Default 0.
#' @param beta Numeric. Prior mean on sampling bias. Default 0.
#'
#' @return A [tibble::tibble()] with columns `N`, `sigma_B`, and `posterior_mean`.
#'
#' @importFrom tibble tibble
#' @importFrom stats rnorm
#' @export
simulate_posteriors <- function(N, sigma_B, sims = 5000,
                                tau     = 0.1,
                                sigma_Y = 1,
                                sigma_g = 0.2,
                                g       = 0,
                                beta    = 0) {
  sigma_x <- sigma_Y / sqrt(N)
  B       <- rnorm(sims, mean = beta, sd = sigma_B)
  x_e     <- rnorm(sims, mean = tau + B, sd = sigma_x)
  post    <- posterior_mean_fn(x_e, g = g, sigma_g = sigma_g,
                               sigma_B = sigma_B, sigma_x = sigma_x)
  tibble::tibble(N = N, sigma_B = sigma_B, posterior_mean = post)
}

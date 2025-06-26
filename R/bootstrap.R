library(tidyverse)
library(rsample)
library(estimatr)

#' @export
lm_bootstrap <- function(formula, data, times = 1000, ...) {
  dots <- rlang::enquos(...)
  
  boot_samples <- rsample::bootstraps(data, times = times)
  
  boot_results <- boot_samples |>
    mutate(
      model = map(splits, function(s) {
        dat <- analysis(s)
        args <- purrr::map(dots, rlang::eval_tidy, data = dat)
        do.call(estimatr::lm_robust, c(list(formula = formula, data = dat, se_type = "none"), args))
      }),
      coefs = map(model, broom::tidy)
    ) |>
    select(id, coefs) |>
    unnest(coefs)
  
  class(boot_results) <- c("lm_bootstrap", class(boot_results))
  return(boot_results)
}



#' @export
tidy.lm_bootstrap <- function(x, alpha = 0.05, ...) {
  x |>
    dplyr::group_by(term) |>
    dplyr::summarize(
      std.error = sd(estimate),
      conf.low = quantile(estimate, alpha / 2),
      conf.high = quantile(estimate, 1 - alpha / 2),
      # have to do this one last because otherwise it overwrites!
      estimate = mean(estimate),
      .groups = "drop"
    ) |> 
    select(term, estimate, std.error, conf.low, conf.high)
}



boot_out <- lm_bootstrap(mpg ~ wt + hp, data = mtcars, times = 1000)

tidy(boot_out, alpha = 0.05)
tidy(boot_out, alpha = 0.10)


#' Simulate a research literature with a gender-composition moderator
#'
#' Generates multiple simulated research literatures in which the true ATE
#' in each study equals `0.1 * proportion_women`, where `proportion_women`
#' ranges uniformly from -0.5 to 0.5 across `N_studies` studies. Each
#' "literature" is a random ordering of those studies, allowing the cumulative
#' meta-regression estimate to be traced as evidence accumulates. Used in
#' Chapter 11 to illustrate how the path of knowledge accumulation affects
#' how quickly a moderating relationship is recovered.
#'
#' Requires the `DeclareDesign` package.
#'
#' @param N Integer. Sample size for each individual study.
#' @param N_studies Integer. Number of studies in the literature.
#' @param N_literatures Integer. Number of random orderings (literature histories)
#'   to generate.
#'
#' @return A tibble of simulation results from [DeclareDesign::simulate_designs()],
#'   with an added `study` column giving each study's position in its literature's
#'   random ordering.
#'
#' @importFrom DeclareDesign declare_model declare_inquiry declare_assignment
#'   declare_measurement declare_estimator redesign simulate_designs
#' @importFrom randomizr complete_ra
#' @importFrom stats rbinom
#' @export
make_studies <- function(N, N_studies, N_literatures) {
  if (!requireNamespace("DeclareDesign", quietly = TRUE)) {
    stop("Package 'DeclareDesign' is required. Install it with install.packages('DeclareDesign').")
  }
  if (!requireNamespace("randomizr", quietly = TRUE)) {
    stop("Package 'randomizr' is required. Install it with install.packages('randomizr').")
  }

  base_design <-
    declare_model(
      N = N,
      Y_Z_0 = rbinom(N, size = 1, prob = 0.5 + 0.10 * proportion_women * 0),
      Y_Z_1 = rbinom(N, size = 1, prob = 0.5 + 0.10 * proportion_women * 1)
    ) +
    declare_inquiry(SATE = mean(Y_Z_1 - Y_Z_0)) +
    declare_assignment(Z = complete_ra(N)) +
    declare_measurement(Y = ifelse(Z == 1, Y_Z_1, Y_Z_0)) +
    declare_estimator(Y ~ Z, inquiry = "SATE")

  base_design |>
    redesign(
      N                = N,
      proportion_women = seq(-0.5, 0.5, length.out = N_studies)
    ) |>
    simulate_designs(sims = N_literatures) |>
    suppressWarnings() |>
    dplyr::group_by(.data$sim_ID) |>
    dplyr::mutate(study = sample(dplyr::row_number())) |>
    dplyr::arrange(.data$sim_ID, .data$study)
}

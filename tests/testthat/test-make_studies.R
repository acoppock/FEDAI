test_that("make_studies returns one row per study per literature, in a random order", {
  skip_if_not_installed("DeclareDesign")
  skip_if_not_installed("randomizr")

  set.seed(5)
  studies <- make_studies(N = 50, N_studies = 6, N_literatures = 3)

  expect_equal(nrow(studies), 6 * 3)
  expect_true(all(c("study", "proportion_women", "estimate") %in% names(studies)))

  # Each literature is a permutation of the same six studies: same set of
  # gender compositions, different order of arrival.
  orderings <- split(studies$study, studies$sim_ID)
  expect_true(all(vapply(orderings, function(o) setequal(o, 1:6), logical(1))))
  expect_equal(length(unique(studies$proportion_women)), 6)
})

test_that("make_studies says which package to install when one is absent", {
  skip_if(requireNamespace("DeclareDesign", quietly = TRUE))
  expect_error(make_studies(N = 50, N_studies = 2, N_literatures = 2), "DeclareDesign")
})

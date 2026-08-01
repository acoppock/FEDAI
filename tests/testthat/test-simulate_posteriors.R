test_that("posterior_mean_fn is a weighted average of prior and estimate", {
  # The two weights are the point: they must sum to one, so the posterior mean
  # always lies between the prior mean and the experimental estimate.
  posterior <- posterior_mean_fn(x_e = 0.5, g = 0, sigma_g = 0.2, sigma_B = 0.1, sigma_x = 0.1)
  expect_gt(posterior, 0)
  expect_lt(posterior, 0.5)

  # A prior of zero width ignores the data; a diffuse prior defers to it.
  expect_equal(
    posterior_mean_fn(x_e = 0.5, g = 0.3, sigma_g = 1e-8, sigma_B = 0.1, sigma_x = 0.1),
    0.3,
    tolerance = 1e-6
  )
  expect_equal(
    posterior_mean_fn(x_e = 0.5, g = 0.3, sigma_g = 1e8, sigma_B = 0.1, sigma_x = 0.1),
    0.5,
    tolerance = 1e-6
  )
})

test_that("sampling-bias uncertainty limits what a large experiment can buy", {
  # With sigma_B > 0 the posterior stops moving toward the estimate as sampling
  # error goes to zero, which is the chapter's point.
  no_bias <- posterior_mean_fn(x_e = 0.5, g = 0, sigma_g = 0.2, sigma_B = 0, sigma_x = 1e-6)
  with_bias <- posterior_mean_fn(x_e = 0.5, g = 0, sigma_g = 0.2, sigma_B = 0.3, sigma_x = 1e-6)

  expect_equal(no_bias, 0.5, tolerance = 1e-4)
  expect_lt(with_bias, 0.4)
})

test_that("simulate_posteriors returns one row per simulation", {
  set.seed(3)
  sims <- simulate_posteriors(N = 500, sigma_B = 0.1, sims = 200)

  expect_s3_class(sims, "tbl_df")
  expect_named(sims, c("N", "sigma_B", "posterior_mean"))
  expect_equal(nrow(sims), 200)
  expect_true(all(sims$N == 500))
  expect_true(all(sims$sigma_B == 0.1))
  expect_true(all(is.finite(sims$posterior_mean)))
})

test_that("posteriors concentrate as the experiment grows, but only without bias", {
  set.seed(4)
  small <- simulate_posteriors(N = 100, sigma_B = 0, sims = 1000)
  large <- simulate_posteriors(N = 10000, sigma_B = 0, sims = 1000)
  large_biased <- simulate_posteriors(N = 10000, sigma_B = 0.3, sims = 1000)

  expect_lt(sd(large$posterior_mean), sd(small$posterior_mean))
  expect_gt(sd(large_biased$posterior_mean), sd(large$posterior_mean))
})

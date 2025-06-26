test_that("lm_bootstrap runs and returns expected structure", {
  skip_on_cran()  # optional: skip if running on CRAN

  set.seed(123)
  boot_out <- lm_bootstrap(mpg ~ wt + hp, data = mtcars, times = 50)

  expect_s3_class(boot_out, "lm_bootstrap")
  expect_true(all(c("term", "estimate") %in% names(boot_out)))
  expect_true(nrow(boot_out) > 0)
  expect_true(any(boot_out$term == "wt"))
  expect_true(any(boot_out$term == "hp"))
})


test_that("tidy.lm_bootstrap returns summary with correct columns", {
  set.seed(123)
  boot_out <- lm_bootstrap(mpg ~ wt + hp, data = mtcars, times = 50)
  summary_df <- tidy(boot_out, alpha = 0.10)

  expect_s3_class(summary_df, "data.frame")
  expect_true(all(c("term", "estimate", "std.error", "conf.low", "conf.high") %in% names(summary_df)))
  expect_equal(nrow(summary_df), length(unique(boot_out$term)))

  # Check alpha works
  ci_width <- summary_df$conf.high - summary_df$conf.low
  summary_df2 <- tidy(boot_out, alpha = 0.01)
  ci_width2 <- summary_df2$conf.high - summary_df2$conf.low
  expect_true(all(ci_width2 > ci_width))  # wider CIs for lower alpha
})

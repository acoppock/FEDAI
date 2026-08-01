test_that("difference_in_variances returns the difference and the F test p-value", {
  set.seed(1)
  dat <- data.frame(Y = c(rnorm(100, sd = 1), rnorm(100, sd = 3)), Z = rep(0:1, each = 100))
  result <- difference_in_variances(dat)

  expect_s3_class(result, "tbl_df")
  expect_equal(nrow(result), 1)
  expect_named(result, c("estimate", "p.value"))

  treated <- dat$Y[dat$Z == 1]
  control <- dat$Y[dat$Z == 0]
  expect_equal(result$estimate, var(treated) - var(control))
  expect_equal(result$p.value, var.test(treated, control)$p.value)
})

test_that("it detects a difference in dispersion and not one in means", {
  set.seed(2)
  spread <- data.frame(Y = c(rnorm(200, sd = 1), rnorm(200, sd = 3)), Z = rep(0:1, each = 200))
  shifted <- data.frame(Y = c(rnorm(200, mean = 0), rnorm(200, mean = 2)), Z = rep(0:1, each = 200))

  expect_lt(difference_in_variances(spread)$p.value, 0.01)
  expect_gt(difference_in_variances(shifted)$p.value, 0.05)
  expect_gt(difference_in_variances(spread)$estimate, 0)
})

test_that("a frame without Y and Z is refused by name", {
  expect_error(
    difference_in_variances(data.frame(outcome = rnorm(10), treatment = rep(0:1, 5))),
    "no column named Y or Z"
  )
  expect_error(
    difference_in_variances(data.frame(Y = rnorm(10), treatment = rep(0:1, 5))),
    "no column named Z"
  )
})

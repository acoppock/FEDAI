test_that("pop_var and pop_sd divide by N rather than N - 1", {
  x <- c(1, 2, 3, 4)
  expect_equal(pop_var(x), var(x) * 3 / 4)
  expect_equal(pop_var(x), mean((x - mean(x))^2))
  expect_equal(pop_sd(x), sqrt(pop_var(x)))
})

test_that("pop_cov divides by N and reduces to pop_var against itself", {
  x <- c(1, 2, 3, 4)
  y <- c(4, 3, 2, 1)
  expect_equal(pop_cov(x, y), cov(x, y) * 3 / 4)
  expect_equal(pop_cov(x, x), pop_var(x))
})

test_that("na.rm = FALSE propagates missingness, as var() does", {
  x <- c(1, 2, NA, 4)
  expect_true(is.na(pop_var(x)))
  expect_true(is.na(pop_sd(x)))
  expect_true(is.na(pop_cov(x, c(4, 3, 2, 1))))
})

test_that("na.rm = TRUE drops missing values and divides by what remains", {
  # This is the regression test for a version in which na.rm was passed only to
  # mean(), so the sum still contained the NA and the result was NA either way
  # while the divisor silently excluded it.
  x <- c(1, 2, NA, 4)
  complete <- c(1, 2, 4)

  expect_equal(pop_var(x, na.rm = TRUE), pop_var(complete))
  expect_equal(pop_sd(x, na.rm = TRUE), pop_sd(complete))
  expect_false(is.na(pop_var(x, na.rm = TRUE)))
})

test_that("pop_cov with na.rm = TRUE uses complete pairs", {
  # A pair is unusable when either element is missing, and the divisor must be
  # the number of pairs that survive, not the number of non-missing x values.
  x <- c(1, 2, 3, NA)
  y <- c(2, 4, NA, 8)
  expect_equal(pop_cov(x, y, na.rm = TRUE), pop_cov(c(1, 2), c(2, 4)))
})

test_that("the population variance of a schedule of potential outcomes is exact", {
  # Table 2.1 is a population of seven villages, not a sample from one, which is
  # the reason these functions exist.
  expect_equal(pop_var(table_2_1$Y_Z_0), mean((table_2_1$Y_Z_0 - mean(table_2_1$Y_Z_0))^2))
  expect_lt(pop_var(table_2_1$Y_Z_0), var(table_2_1$Y_Z_0))
})

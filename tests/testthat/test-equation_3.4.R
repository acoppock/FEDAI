test_that("equation_3.4 calculates correct value", {
  # Calculate population variances and covariance from the dataset
  var_Y0 <- pop_var(table_2_1$Y_Z_0)
  var_Y1 <- pop_var(table_2_1$Y_Z_1)
  cov_Y0_Y1 <- pop_cov(table_2_1$Y_Z_0, table_2_1$Y_Z_1)

  # Expected value (pre-computed)
  expected_value <- 4.6033114

  # Run the function and check if the output matches expected value
  result <- equation_3.4(
    var_Y0 = var_Y0,
    var_Y1 = var_Y1,
    cov_Y0_Y1 = cov_Y0_Y1,
    N = 7,
    m = 2
  )

  expect_equal(result, expected_value)
})

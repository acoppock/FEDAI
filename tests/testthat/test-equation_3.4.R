test_that("equation_3.4 equals the standard deviation of the sampling distribution", {
  # The formula claims to give the true standard error under complete random
  # assignment. With 7 units and 2 treated there are only 21 possible
  # assignments, so the sampling distribution can be enumerated exactly and the
  # claim checked, rather than pinned to a remembered number.
  assignments <- combn(7, 2)
  estimates <- apply(assignments, 2, function(treated) {
    mean(table_2_1$Y_Z_1[treated]) - mean(table_2_1$Y_Z_0[-treated])
  })
  exact_se <- sqrt(mean((estimates - mean(estimates))^2))

  from_formula <- equation_3.4(
    var_Y0 = pop_var(table_2_1$Y_Z_0),
    var_Y1 = pop_var(table_2_1$Y_Z_1),
    cov_Y0_Y1 = pop_cov(table_2_1$Y_Z_0, table_2_1$Y_Z_1),
    N = 7,
    m = 2
  )

  expect_equal(from_formula, exact_se)
  expect_equal(round(from_formula, 7), 4.6033114)
})

test_that("equation_3.4 does not care which arm is called treatment", {
  # Relabelling the arms swaps both the variances and the number treated, and
  # must leave the standard error alone.
  forward <- equation_3.4(var_Y0 = 4, var_Y1 = 9, cov_Y0_Y1 = 3, N = 20, m = 8)
  reversed <- equation_3.4(var_Y0 = 9, var_Y1 = 4, cov_Y0_Y1 = 3, N = 20, m = 12)
  expect_equal(forward, reversed)
})

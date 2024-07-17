

var_Y0 <- pop_var(table_2.1$Y_Z_0)
var_Y1 <- pop_var(table_2.1$Y_Z_1)
cov_Y0_Y1 <- pop_cov(table_2.1$Y_Z_0, table_2.1$Y_Z_1)

expect_equal(equation_3.4(var_Y0 = var_Y0,
             var_Y1 = var_Y1,
             cov_Y0_Y1 = cov_Y0_Y1,
             N = 7,
             m = 2),
             4.6033114)

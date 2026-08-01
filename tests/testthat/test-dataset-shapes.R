# Dimensions and column names for every dataset, one block each. These are the
# invariants the documentation states and the build scripts must keep producing:
# a rebuild from the archive that silently returns a different shape fails here
# rather than shipping. Statistical anchors for the exercise datasets, which
# catch a right-shaped wrong file, live in test-exercise-datasets.R.

test_that("arceneaux_2005 has the documented shape", {
  expect_s3_class(arceneaux_2005, "tbl_df")
  expect_equal(dim(arceneaux_2005), c(9712L, 4L))
  expect_named(
    arceneaux_2005,
    c(
    "precinct", "Z", "D_contact", "Y_voted_2003"
    )
  )
})

test_that("bhavnani_2009 has the documented shape", {
  expect_s3_class(bhavnani_2009, "data.frame")
  expect_equal(dim(bhavnani_2009), c(227L, 4L))
  expect_named(
    bhavnani_2009,
    c(
    "controltreat", "genderofwinner", "turnout", "turnout97"
    )
  )
})

test_that("box_3_7 has the documented shape", {
  expect_s3_class(box_3_7, "tbl_df")
  expect_equal(dim(box_3_7), c(20L, 2L))
  expect_named(
    box_3_7,
    c(
    "Z", "Y"
    )
  )
})

test_that("clingingsmith_khwaja_kremer_2009 has the documented shape", {
  expect_s3_class(clingingsmith_khwaja_kremer_2009, "tbl_df")
  expect_equal(dim(clingingsmith_khwaja_kremer_2009), c(958L, 2L))
  expect_named(
    clingingsmith_khwaja_kremer_2009,
    c(
    "Z_hajj", "Y_views"
    )
  )
})

test_that("dupas_2010 has the documented shape", {
  expect_s3_class(dupas_2010, "data.frame")
  expect_equal(dim(dupas_2010), c(1120L, 3L))
  expect_named(
    dupas_2010,
    c(
    "cfw_id", "price", "purchasednet"
    )
  )
})

test_that("fieldhouse_etal_2010 has the documented shape", {
  expect_s3_class(fieldhouse_etal_2010, "data.frame")
  expect_equal(dim(fieldhouse_etal_2010), c(15300L, 6L))
  expect_named(
    fieldhouse_etal_2010,
    c(
    "m", "p", "c", "y", "p_m", "c_m"
    )
  )
})

test_that("guan_green_2006 has the documented shape", {
  expect_s3_class(guan_green_2006, "data.frame")
  expect_equal(dim(guan_green_2006), c(4024L, 4L))
  expect_named(
    guan_green_2006,
    c(
    "turnout", "contact", "dormid", "treat2"
    )
  )
})

test_that("howell_peterson_2002 has the documented shape", {
  expect_s3_class(howell_peterson_2002, "data.frame")
  expect_equal(dim(howell_peterson_2002), c(1851L, 4L))
  expect_named(
    howell_peterson_2002,
    c(
    "treat", "missing_y1math", "y0_1math_change", "subset_desc"
    )
  )
})

test_that("hyde_2010 has the documented shape", {
  expect_s3_class(hyde_2010, "data.frame")
  expect_equal(dim(hyde_2010), c(1971L, 3L))
  expect_named(
    hyde_2010,
    c(
    "observed", "invalidballots", "Sample"
    )
  )
})

test_that("obrien_patsiorkovski_1999 has the documented shape", {
  expect_s3_class(obrien_patsiorkovski_1999, "data.frame")
  expect_equal(dim(obrien_patsiorkovski_1999), c(462L, 8L))
  expect_named(
    obrien_patsiorkovski_1999,
    c(
    "sexresp6", "ageresp6", "group6", "memberc6", "index95",
    "index96", "index97", "randsort"
    )
  )
})

test_that("rind_bordia_1996 has the documented shape", {
  expect_s3_class(rind_bordia_1996, "data.frame")
  expect_equal(dim(rind_bordia_1996), c(89L, 5L))
  expect_named(
    rind_bordia_1996,
    c(
    "female", "happyface", "tip", "xhappy", "tipround"
    )
  )
})

test_that("rosen_2010 has the documented shape", {
  expect_s3_class(rosen_2010, "tbl_df")
  expect_equal(dim(rosen_2010), c(400L, 7L))
  expect_named(
    rosen_2010,
    c(
    "observation", "letter_name", "X_legislator_hispanic",
    "Z_hispanic", "Z_grammar_label", "Z_good_grammar", "Y_response"
    )
  )
})

test_that("table_10_1 has the documented shape", {
  expect_s3_class(table_10_1, "tbl_df")
  expect_equal(dim(table_10_1), c(6L, 10L))
  expect_named(
    table_10_1,
    c(
    "population_share", "Z", "M_Z_0", "M_Z_1", "M", "Y_Z_0",
    "Y_Z_1", "Y", "e1", "e3"
    )
  )
})

test_that("table_12_2 has the documented shape", {
  expect_s3_class(table_12_2, "tbl_df")
  expect_equal(dim(table_12_2), c(6L, 4L))
  expect_named(
    table_12_2,
    c(
    "income", "opportunity", "N_pop", "effect"
    )
  )
})

test_that("table_12_5 has the documented shape", {
  expect_s3_class(table_12_5, "tbl_df")
  expect_equal(dim(table_12_5), c(4L, 3L))
  expect_named(
    table_12_5,
    c(
    "type", "Y_Z_0", "Y_Z_1"
    )
  )
})

test_that("table_2_1 has the documented shape", {
  expect_s3_class(table_2_1, "tbl_df")
  expect_equal(dim(table_2_1), c(7L, 4L))
  expect_named(
    table_2_1,
    c(
    "Village", "Y_Z_0", "Y_Z_1", "tau_i"
    )
  )
})

test_that("table_2_2 has the documented shape", {
  expect_s3_class(table_2_2, "tbl_df")
  expect_equal(dim(table_2_2), c(7L, 6L))
  expect_named(
    table_2_2,
    c(
    "Village", "Z", "Y_Z_0", "Y_Z_1", "Y", "tau_i"
    )
  )
})

test_that("table_3_3 has the documented shape", {
  expect_s3_class(table_3_3, "tbl_df")
  expect_equal(dim(table_3_3), c(14L, 4L))
  expect_named(
    table_3_3,
    c(
    "Village", "Block", "Y_Z_0", "Y_Z_1"
    )
  )
})

test_that("table_3_4 has the documented shape", {
  expect_s3_class(table_3_4, "tbl_df")
  expect_equal(dim(table_3_4), c(14L, 4L))
  expect_named(
    table_3_4,
    c(
    "Village", "Block", "D", "Y"
    )
  )
})

test_that("table_3_5 has the documented shape", {
  expect_s3_class(table_3_5, "tbl_df")
  expect_equal(dim(table_3_5), c(14L, 3L))
  expect_named(
    table_3_5,
    c(
    "Block", "D", "Y"
    )
  )
})

test_that("table_3_6 has the documented shape", {
  expect_s3_class(table_3_6, "tbl_df")
  expect_equal(dim(table_3_6), c(12L, 6L))
  expect_named(
    table_3_6,
    c(
    "school", "classroom", "Y_Z_0", "Y_Z_1", "Y_cluster_mean_Z_0",
    "Y_cluster_mean_Z_1"
    )
  )
})

test_that("table_3_7 has the documented shape", {
  expect_s3_class(table_3_7, "tbl_df")
  expect_equal(dim(table_3_7), c(12L, 6L))
  expect_named(
    table_3_7,
    c(
    "school", "classroom", "Y_Z_0", "Y_Z_1", "Y_cluster_mean_Z_0",
    "Y_cluster_mean_Z_1"
    )
  )
})

test_that("table_4_1 has the documented shape", {
  expect_s3_class(table_4_1, "tbl_df")
  expect_equal(dim(table_4_1), c(40L, 6L))
  expect_named(
    table_4_1,
    c(
    "observation", "X_pretest", "X_pretest_weak", "Z", "Y_Z_0",
    "Y_Z_1"
    )
  )
})

test_that("table_4_2 has the documented shape", {
  expect_s3_class(table_4_2, "tbl_df")
  expect_equal(dim(table_4_2), c(40L, 9L))
  expect_named(
    table_4_2,
    c(
    "observation", "block", "X_pretest", "X_pretest_weak", "Z",
    "prob", "wt", "Y_Z_0", "Y_Z_1"
    )
  )
})

test_that("table_5_1 has the documented shape", {
  expect_s3_class(table_5_1, "tbl_df")
  expect_equal(dim(table_5_1), c(9L, 6L))
  expect_named(
    table_5_1,
    c(
    "observation", "type", "D_Z_0", "D_Z_1", "Y_D_0", "Y_D_1"
    )
  )
})

test_that("table_6_1 has the documented shape", {
  expect_s3_class(table_6_1, "tbl_df")
  expect_equal(dim(table_6_1), c(10L, 8L))
  expect_named(
    table_6_1,
    c(
    "observation", "type", "D_Z_0", "D_Z_1", "Y_D_0", "Y_D_1",
    "Y_Z_0", "Y_Z_1"
    )
  )
})

test_that("table_6_4 has the documented shape", {
  expect_s3_class(table_6_4, "tbl_df")
  expect_equal(dim(table_6_4), c(32L, 8L))
  expect_named(
    table_6_4,
    c(
    "observation", "subject_type", "Z", "wt", "D_Z_0", "D_Z_1",
    "Y_D_0", "Y_D_1"
    )
  )
})

test_that("table_7_1 has the documented shape", {
  expect_s3_class(table_7_1, "tbl_df")
  expect_equal(dim(table_7_1), c(8L, 8L))
  expect_named(
    table_7_1,
    c(
    "observation", "type", "R_Z_0", "R_Z_1", "Y_Z_0", "Y_Z_1",
    "Y_Z_0_R_Z_0", "Y_Z_1_R_Z_1"
    )
  )
})

test_that("table_7_2 has the documented shape", {
  expect_s3_class(table_7_2, "tbl_df")
  expect_equal(dim(table_7_2), c(8L, 8L))
  expect_named(
    table_7_2,
    c(
    "observation", "X", "R_Z_0", "R_Z_1", "Y_Z_0", "Y_Z_1",
    "Y_Z_0_R_Z_0", "Y_Z_1_R_Z_1"
    )
  )
})

test_that("table_7_7 has the documented shape", {
  expect_s3_class(table_7_7, "tbl_df")
  expect_equal(dim(table_7_7), c(4L, 8L))
  expect_named(
    table_7_7,
    c(
    "observation", "Pair", "R_Z_0", "R_Z_1", "Y_Z_0", "Y_Z_1",
    "Y_Z_0_R_Z_0", "Y_Z_1_R_Z_1"
    )
  )
})

test_that("table_8_1 has the documented shape", {
  expect_s3_class(table_8_1, "tbl_df")
  expect_equal(dim(table_8_1), c(3L, 5L))
  expect_named(
    table_8_1,
    c(
    "observation", "Y_Z_Mary", "Y_Z_Peter", "Y_Z_Limor",
    "Y_Z_Nobody"
    )
  )
})

test_that("table_8_2 has the documented shape", {
  expect_s3_class(table_8_2, "tbl_df")
  expect_equal(dim(table_8_2), c(5L, 4L))
  expect_named(
    table_8_2,
    c(
    "observation", "Y_A_0_Z_0", "Y_A_1_Z_0", "Y_A_0_Z_1"
    )
  )
})

test_that("table_8_4 has the documented shape", {
  expect_s3_class(table_8_4, "tbl_df")
  expect_equal(dim(table_8_4), c(30L, 17L))
  expect_named(
    table_8_4,
    c(
    "hotspot", "x", "y", "hotspots_within_500m",
    "hotspots_within_750m", "A", "Z", "exposure", "prob_A_0_Z_0",
    "prob_A_0_Z_1", "prob_A_1_Z_0", "prob_A_1_Z_1", "Y_A_0_Z_0",
    "Y_A_0_Z_1", "Y_A_1_Z_0", "Y_A_1_Z_1", "Y"
    )
  )
})

test_that("table_8_4_distmat has the documented shape", {
  expect_true(is.matrix(table_8_4_distmat))
  expect_equal(dim(table_8_4_distmat), c(30L, 30L))
  expect_equal(unname(diag(table_8_4_distmat)), rep(0, 30))
})

test_that("table_8_7 has the documented shape", {
  expect_s3_class(table_8_7, "tbl_df")
  expect_equal(dim(table_8_7), c(24L, 8L))
  expect_named(
    table_8_7,
    c(
    "market", "period", "prob_P_0_C_0", "prob_P_0_C_1",
    "prob_P_1_C_1", "Y_P_0_C_0", "Y_P_0_C_1", "Y_P_1_C_1"
    )
  )
})

test_that("table_9_1 has the documented shape", {
  expect_s3_class(table_9_1, "tbl_df")
  expect_equal(dim(table_9_1), c(4L, 4L))
  expect_named(
    table_9_1,
    c(
    "Z_author", "Z_good_grammar", "Y_reply_pct", "N"
    )
  )
})

test_that("table_9_2 has the documented shape", {
  expect_s3_class(table_9_2, "tbl_df")
  expect_equal(dim(table_9_2), c(8L, 5L))
  expect_named(
    table_9_2,
    c(
    "X_legislator_hispanic", "Z_author", "Z_good_grammar",
    "Y_reply_pct", "N"
    )
  )
})

test_that("titiunik_2010 has the documented shape", {
  expect_s3_class(titiunik_2010, "data.frame")
  expect_equal(dim(titiunik_2010), c(124L, 6L))
  expect_named(
    titiunik_2010,
    c(
    "year", "party", "dshort_term", "votesh_incumb",
    "usrepvotesh_dem", "bills_intro"
    )
  )
})


test_that("no dataset leaks haven attributes from its Stata source", {
  # read_dta() carries value labels, variable labels and Stata format strings.
  # zap_labels() alone removes only the first of the three, which is how
  # `label` and `format.stata` attributes reached 11 datasets once. Factors
  # legitimately carry levels and class; nothing else should carry anything.
  datasets <- utils::data(package = "FEDAI")$results[, "Item"]

  leaked <- unlist(lapply(datasets, function(nm) {
    x <- get(nm, envir = asNamespace("FEDAI"))
    if (is.matrix(x)) return(NULL)
    stray <- vapply(x, function(col) {
      allowed <- if (is.factor(col)) c("levels", "class") else character(0)
      length(setdiff(names(attributes(col)), allowed)) > 0
    }, logical(1))
    if (any(stray)) paste0(nm, "$", names(x)[stray]) else NULL
  }))

  expect_equal(leaked, NULL)
})

test_that("every column has the type the documentation implies", {
  # A probability read from Stata as text stays text unless the build converts
  # it, and a character probability column breaks anything that combines it
  # with a numeric one. table_8_4 shipped that way for exactly one session.
  expect_type(table_8_4$prob_A_0_Z_0, "double")
  expect_type(table_8_4$prob_A_0_Z_1, "double")
  expect_type(table_8_4$prob_A_1_Z_0, "double")
  expect_type(table_8_4$prob_A_1_Z_1, "double")
  expect_type(table_8_4$hotspots_within_500m, "double")
  expect_type(table_8_4$hotspots_within_750m, "double")

  # The exposure condition and its two components stay character: they are
  # labels, and "00" must not become 0.
  expect_type(table_8_4$A, "character")
  expect_type(table_8_4$Z, "character")
  expect_type(table_8_4$exposure, "character")
})

test_that("obrien_patsiorkovski_1999 has correct structure and values", {
  expect_s3_class(obrien_patsiorkovski_1999, "data.frame")
  expect_equal(nrow(obrien_patsiorkovski_1999), 462)
  expect_equal(ncol(obrien_patsiorkovski_1999), 8)
  expect_named(obrien_patsiorkovski_1999,
    c("sexresp6", "ageresp6", "group6", "memberc6",
      "index95", "index96", "index97", "randsort"))
  # group6 has four treatment arms (1–4)
  expect_equal(sort(unique(obrien_patsiorkovski_1999$group6)), 1:4)
  expect_equal(round(mean(obrien_patsiorkovski_1999$index97), 3), 6.039)
})

test_that("guan_green_2006 has correct structure and values", {
  expect_s3_class(guan_green_2006, "data.frame")
  expect_equal(nrow(guan_green_2006), 4024)
  expect_equal(ncol(guan_green_2006), 4)
  expect_named(guan_green_2006, c("turnout", "contact", "dormid", "treat2"))
  # 2 missing turnout values; all others 0/1
  expect_equal(sum(is.na(guan_green_2006$turnout)), 2)
  expect_equal(round(mean(guan_green_2006$turnout, na.rm = TRUE), 4), 0.7568)
  expect_equal(round(mean(guan_green_2006$treat2), 4), 0.6685)
})

test_that("hyde_2010 has correct structure and values", {
  expect_s3_class(hyde_2010, "data.frame")
  expect_equal(nrow(hyde_2010), 1971)
  expect_equal(ncol(hyde_2010), 3)
  expect_named(hyde_2010, c("observed", "invalidballots", "Sample"))
  expect_equal(sum(hyde_2010$observed), 89)
  expect_equal(round(mean(hyde_2010$invalidballots), 4), 82.3359)
})

test_that("rind_bordia_1996 has correct structure and values", {
  expect_s3_class(rind_bordia_1996, "data.frame")
  expect_equal(nrow(rind_bordia_1996), 89)
  expect_equal(ncol(rind_bordia_1996), 5)
  expect_named(rind_bordia_1996, c("female", "happyface", "tip", "xhappy", "tipround"))
  expect_equal(sum(rind_bordia_1996$female), 45)
  expect_equal(round(mean(rind_bordia_1996$tip), 4), 24.9922)
})

test_that("fieldhouse_etal_2010 has correct structure and values", {
  expect_s3_class(fieldhouse_etal_2010, "data.frame")
  expect_equal(nrow(fieldhouse_etal_2010), 15300)
  expect_equal(ncol(fieldhouse_etal_2010), 6)
  expect_named(fieldhouse_etal_2010, c("m", "p", "c", "y", "p_m", "c_m"))
  expect_equal(sum(fieldhouse_etal_2010$m), 6654)
  expect_equal(round(mean(fieldhouse_etal_2010$y), 4), 0.4018)
})

test_that("bhavnani_2009 has correct structure and values", {
  expect_s3_class(bhavnani_2009, "data.frame")
  expect_equal(nrow(bhavnani_2009), 227)
  expect_equal(ncol(bhavnani_2009), 4)
  expect_named(bhavnani_2009, c("controltreat", "genderofwinner", "turnout", "turnout97"))
  expect_equal(sum(bhavnani_2009$controltreat, na.rm = TRUE), 37)
  expect_equal(round(mean(bhavnani_2009$turnout, na.rm = TRUE), 4), 42.1587)
})

test_that("dupas_2010 has correct structure and values", {
  expect_s3_class(dupas_2010, "data.frame")
  expect_equal(nrow(dupas_2010), 1120)
  expect_equal(ncol(dupas_2010), 3)
  expect_named(dupas_2010, c("cfw_id", "price", "purchasednet"))
  # price is a randomized subsidy level; 17 distinct values
  expect_equal(length(unique(dupas_2010$price)), 17)
  expect_true(all(dupas_2010$purchasednet %in% c("yes", "no")))
})

test_that("howell_peterson_2002 has correct structure and values", {
  expect_s3_class(howell_peterson_2002, "data.frame")
  expect_equal(nrow(howell_peterson_2002), 1851)
  expect_equal(ncol(howell_peterson_2002), 4)
  expect_named(howell_peterson_2002,
    c("treat", "missing_y1math", "y0_1math_change", "subset_desc"))
  expect_equal(sum(howell_peterson_2002$treat), 963)
  expect_equal(round(mean(howell_peterson_2002$y0_1math_change, na.rm = TRUE), 4), 6.8186)
})

test_that("titiunik_2010 has correct structure and values", {
  expect_s3_class(titiunik_2010, "data.frame")
  expect_equal(nrow(titiunik_2010), 124)
  expect_equal(ncol(titiunik_2010), 6)
  expect_named(titiunik_2010,
    c("year", "party", "dshort_term", "votesh_incumb", "usrepvotesh_dem", "bills_intro"))
  expect_setequal(unique(titiunik_2010$party), c("Dem.", "Rep."))
  # four distinct year-session codes
  expect_equal(length(unique(titiunik_2010$year)), 4)
  expect_equal(sum(titiunik_2010$year), 1359691)
})

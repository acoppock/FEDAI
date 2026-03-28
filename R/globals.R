# Suppress R CMD check NOTEs for column names used inside dplyr verbs.
utils::globalVariables(c(
  # lm_bootstrap
  "splits", "model", "id", "coefs", "term",
  # make_studies
  "proportion_women", "Y_Z_0", "Y_Z_1", "sim_ID", "Z", ".data"
))

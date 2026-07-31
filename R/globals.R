# Suppress R CMD check NOTEs for column names used inside dplyr verbs.
utils::globalVariables(c(
  # make_studies
  "proportion_women", "Y_Z_0", "Y_Z_1", "sim_ID", "Z", ".data"
))

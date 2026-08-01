library(tidyverse)
library(haven)

# Fetch from the ISPS Data Archive ----

# Every dataset in this package that comes from the published archive comes from
# study D081, "Field Experiments: Design, Analysis, and Interpretation"
# (doi:10.60600/YU/VUH8KD), hosted on Yale Dataverse. Files there are addressed
# by a numeric id that is stable across dataset versions, so a build script can
# name the exact file it read.
#
# `?format=original` matters: without it Dataverse serves its own ingested TSV,
# which has already dropped the Stata value labels that several of these builds
# rely on. With it, the file arrives as deposited.

d081_doi <- "doi:10.60600/YU/VUH8KD"
cache_dir <- "data-raw/cache"

d081_file <- function(file_id) {
  dir.create(cache_dir, showWarnings = FALSE, recursive = TRUE)
  dest <- file.path(cache_dir, file_id)
  if (!file.exists(dest)) {
    download.file(
      paste0("https://dataverse.yale.edu/api/access/datafile/", file_id, "?format=original"),
      dest, mode = "wb", quiet = TRUE
    )
  }
  dest
}

# The archive stores potential outcomes under the book's original notation,
# where `Y` is the untreated potential outcome and `D` the treated one. This
# package writes them as `Y_Z_0` and `Y_Z_1`, which is why nearly every build
# below renames those two columns.

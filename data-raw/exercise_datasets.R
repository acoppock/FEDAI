source("data-raw/helpers.R")

# The nine datasets the book's exercises ask the reader to download. Each is
# shipped exactly as the archive holds it: no columns dropped, no renaming, so
# that a reader following the exercise sees the same column names the exercise
# text names. That is why these keep their original, sometimes cryptic, names.
#
# They are also the only datasets here stored as plain data frames rather than
# tibbles, which is how they were first added and is preserved so that existing
# exercise solutions keep behaving the same way.

# obrien_patsiorkovski_1999 ----

obrien_patsiorkovski_1999 <-
  read_dta(d081_file(42331)) |>
  zap_labels() |>
  zap_formats() |>
  as.data.frame()

# guan_green_2006 ----

guan_green_2006 <-
  read_dta(d081_file(42342)) |>
  zap_labels() |>
  zap_formats() |>
  as.data.frame()

# hyde_2010 ----

hyde_2010 <-
  read_csv(d081_file(42372), show_col_types = FALSE) |>
  as.data.frame()

# rind_bordia_1996 ----

rind_bordia_1996 <-
  read_dta(d081_file(42341)) |>
  zap_labels() |>
  zap_formats() |>
  as.data.frame()

# fieldhouse_etal_2010 ----

fieldhouse_etal_2010 <-
  read_dta(d081_file(42348)) |>
  zap_labels() |>
  zap_formats() |>
  as.data.frame()

# bhavnani_2009 ----

bhavnani_2009 <-
  read_dta(d081_file(42369)) |>
  zap_labels() |>
  zap_formats() |>
  as.data.frame()

# dupas_2010 ----

dupas_2010 <-
  read_csv(d081_file(42278), show_col_types = FALSE) |>
  as.data.frame()

# howell_peterson_2002 ----

howell_peterson_2002 <-
  read_csv(d081_file(42361), show_col_types = FALSE) |>
  as.data.frame()

# titiunik_2010 ----

titiunik_2010 <-
  read_dta(d081_file(42333)) |>
  mutate(
    party = as.character(as_factor(party)),
    dshort_term = as.character(as_factor(dshort_term))
  ) |>
  zap_labels() |>
  zap_formats() |>
  as.data.frame()

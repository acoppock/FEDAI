source("data-raw/helpers.R")

# Study datasets used in the chapters themselves, as opposed to the exercise
# datasets. All three are in D081; each is cut down to the columns the book uses
# and renamed into the package's X_/Z_/D_/Y_ conventions.

# arceneaux_2005 ----

# Precinct-level cluster-randomized canvassing experiment in Kansas City. The
# archive file carries the full turnout history back to 1996; the book uses the
# 2003 outcome only.

arceneaux_2005 <-
  read_dta(d081_file(42260)) |>
  transmute(
    precinct = unit,
    Z = treatment,
    D_contact = contact,
    Y_voted_2003 = vote03
  ) |>
  zap_label() |>
  zap_labels() |>
  zap_formats()

# clingingsmith_khwaja_kremer_2009 ----

# The Hajj lottery. `views` is the index of views toward other Muslim
# nationalities; `success` is winning the visa lottery.

clingingsmith_khwaja_kremer_2009 <-
  read_dta(d081_file(42299)) |>
  transmute(
    Z_hajj = success,
    Y_views = views
  ) |>
  zap_label() |>
  zap_labels() |>
  zap_formats()

# rosen_2010 ----

# 2x2 factorial audit study of state legislators. The archive file is Stata with
# value labels on every column, which is why this reads the original rather than
# Dataverse's ingested copy: `letter_name` and `Z_grammar_label` are those
# labels, and the numeric indicators are built from them.

rosen_2010 <-
  read_dta(d081_file(42255)) |>
  transmute(
    observation = 1:n(),
    letter_name = as_factor(Colin_Jose),
    X_legislator_hispanic = zap_label(Hispanic),
    Z_hispanic = if_else(letter_name == "Jose", 1, 0),
    Z_grammar_label = as_factor(Good_Bad_Grammar),
    Z_good_grammar = if_else(Z_grammar_label == "good", 1, 0),
    Y_response = zap_label(Response)
  ) |>
  zap_label() |>
  zap_labels() |>
  zap_formats()

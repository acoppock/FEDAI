source("data-raw/helpers.R")

# Tables and boxes reproduced from the book. Everything here except the two
# Chapter 12 tables comes from ISPS study D081; the exceptions are noted where
# they occur.

# table_2_1 ----

table_2_1 <-
  read_csv(d081_file(42291), show_col_types = FALSE) |>
  set_names(c("Village", "Y_Z_0", "Y_Z_1", "tau_i"))

# table_2_2 ----

# The archive's Table 2.2 file records only the realized assignment and outcome.
# The version shipped here is derived from Table 2.1 instead, so that the
# unobserved potential outcomes appear as NA in the same columns that Table 2.1
# fills in. The assignment vector is the one printed in the book.

table_2_2 <-
  table_2_1 |>
  mutate(
    Z = c(1, 0, 0, 0, 0, 0, 1),
    Y = if_else(Z == 1, Y_Z_1, Y_Z_0),
    Y_Z_0 = if_else(Z == 1, NA_real_, Y_Z_0),
    Y_Z_1 = if_else(Z == 1, Y_Z_1, NA_real_),
    tau_i = NA_real_
  ) |>
  select(Village, Z, Y_Z_0, Y_Z_1, Y, tau_i)

# table_3_3 ----

table_3_3 <-
  read_csv(d081_file(42294), show_col_types = FALSE) |>
  transmute(Village, Block, Y_Z_0 = Y, Y_Z_1 = D)

# table_3_4 ----

# Y and D stay character here because the table prints "." for the potential
# outcome that assignment did not reveal.

table_3_4 <-
  read_csv(d081_file(42353), show_col_types = FALSE, col_types = cols(Y = "c", D = "c")) |>
  select(Village, Block, D, Y)

# table_3_5 ----

table_3_5 <-
  read_csv(d081_file(42312), show_col_types = FALSE, col_types = cols(Y = "c", D = "c")) |>
  select(Block, D, Y)

# table_3_6 ----

table_3_6 <-
  read_csv(d081_file(42283), show_col_types = FALSE) |>
  transmute(
    school = LETTERS[School],
    classroom = paste0(school, "-", Classroom),
    Y_Z_0 = Y,
    Y_Z_1 = D,
    Y_cluster_mean_Z_0 = Y_clustermean,
    Y_cluster_mean_Z_1 = D_clustermean
  )

# table_3_7 ----

table_3_7 <-
  read_csv(d081_file(42370), show_col_types = FALSE) |>
  transmute(
    school = LETTERS[School],
    classroom = paste0(school, "-", Classroom),
    Y_Z_0 = Y,
    Y_Z_1 = D,
    Y_cluster_mean_Z_0 = Y_clustermean,
    Y_cluster_mean_Z_1 = D_clustermean
  )

# box_3_7 ----

box_3_7 <- read_csv(d081_file(42300), show_col_types = FALSE)

# table_4_1 ----

table_4_1 <-
  read_csv(d081_file(42368), show_col_types = FALSE) |>
  transmute(
    observation = Observation,
    X_pretest = x,
    X_pretest_weak = x_weak,
    Z = D,
    Y_Z_0 = y0,
    Y_Z_1 = y1
  )

# table_4_2 ----

# The blocked version of the teacher incentives design. The archive keeps the
# blocked and unblocked versions in one file, unsorted; `subject` is the
# observation number that Table 4.1 uses.

table_4_2 <-
  read_dta(d081_file(42335)) |>
  arrange(subject) |>
  transmute(
    observation = subject,
    block,
    X_pretest = x,
    X_pretest_weak = xweak,
    Z = d2,
    prob,
    wt,
    Y_Z_0 = y0,
    Y_Z_1 = y1
  ) |>
  zap_label() |>
  zap_labels() |>
  zap_formats()

# table_5_1 ----

table_5_1 <-
  read_csv(d081_file(42330), show_col_types = FALSE) |>
  transmute(
    observation = Observation,
    type = Type,
    D_Z_0 = `D[Z=0]`,
    D_Z_1 = `D[Z=1]`,
    Y_D_0 = `Y[D=0]`,
    Y_D_1 = `Y[D=1]`
  )

# table_6_1 ----

table_6_1 <-
  read_csv(d081_file(42280), show_col_types = FALSE) |>
  transmute(
    observation = Observation,
    type = `Subject Type`,
    D_Z_0 = d_z0,
    D_Z_1 = d_z1,
    Y_D_0 = Y_d0,
    Y_D_1 = Y_d1,
    Y_Z_0 = Y_z0,
    Y_Z_1 = Y_z1
  )

# table_6_4 ----

table_6_4 <-
  read_csv(d081_file(42309), show_col_types = FALSE) |>
  transmute(
    observation,
    subject_type,
    Z = z,
    wt,
    D_Z_0 = d_0,
    D_Z_1 = d_1,
    Y_D_0 = y_0,
    Y_D_1 = y_1
  )

# table_7_1 ----

# `type` is not in the archive file; it is the reporting type implied by the
# pair of reporting potential outcomes, which the book's table prints.

table_7_1 <-
  read_csv(d081_file(42354), show_col_types = FALSE) |>
  transmute(
    observation = Observation,
    type = case_when(
      r0 == 1 & r1 == 1 ~ "Always-reporter",
      r0 == 0 & r1 == 1 ~ "If-treated-reporter",
      r0 == 1 & r1 == 0 ~ "If-untreated-reporter",
      r0 == 0 & r1 == 0 ~ "Never-reporter"
    ),
    R_Z_0 = r0,
    R_Z_1 = r1,
    Y_Z_0 = Y0,
    Y_Z_1 = Y1,
    Y_Z_0_R_Z_0 = as.numeric(na_if(Y0_r0, "Missing")),
    Y_Z_1_R_Z_1 = as.numeric(na_if(Y1_r1, "Missing"))
  )

# table_7_2 ----

table_7_2 <-
  read_csv(d081_file(42286), show_col_types = FALSE,
           col_types = cols(Y0_r0 = "c", Y1_r1 = "c")) |>
  transmute(
    observation = Observation,
    X,
    R_Z_0 = r0,
    R_Z_1 = r1,
    Y_Z_0 = Y0,
    Y_Z_1 = Y1,
    Y_Z_0_R_Z_0 = as.numeric(na_if(Y0_r0, "Missing")),
    Y_Z_1_R_Z_1 = as.numeric(na_if(Y1_r1, "Missing"))
  )

# table_7_7 ----

table_7_7 <-
  read_csv(d081_file(42265), show_col_types = FALSE, col_types = cols(Y1_r1 = "c")) |>
  transmute(
    observation = Observation,
    Pair,
    R_Z_0 = r0,
    R_Z_1 = r1,
    Y_Z_0 = Y0,
    Y_Z_1 = Y1,
    Y_Z_0_R_Z_0 = Y0_r0,
    Y_Z_1_R_Z_1 = Y1_r1
  )

# table_8_1 ----

table_8_1 <-
  read_csv(d081_file(42352), show_col_types = FALSE) |>
  transmute(
    observation = Sales_Agent,
    Y_Z_Mary = Outcome_MaryH,
    Y_Z_Peter = Outcome_PeterH,
    Y_Z_Limor = Outcome_LimorH,
    Y_Z_Nobody = Outcome_Nobody
  )

# table_8_2 ----

table_8_2 <-
  read_csv(d081_file(42380), show_col_types = FALSE) |>
  transmute(
    observation = Village,
    Y_A_0_Z_0 = Y_00,
    Y_A_1_Z_0 = Y_10,
    Y_A_0_Z_1 = Y_01
  )

# table_8_4 and table_8_4_distmat ----

# The hotspot coordinates are not in the archive as data. They are drawn in the
# archive's own Chapter 8 figure code (file 42377) from `set.seed(1337)`, which
# is why they can be regenerated here exactly rather than shipped as a file. The
# distance matrix is the Euclidean distance between those coordinates.

set.seed(1337)
n_hotspots <- 30
draws <- rnorm(n_hotspots * 2)
coords <- tibble(x = draws[1:n_hotspots], y = draws[(n_hotspots + 1):(2 * n_hotspots)])

table_8_4 <-
  read_dta(d081_file(42273)) |>
  transmute(
    hotspot,
    hotspots_within_500m = as.numeric(prox500),
    hotspots_within_750m = as.numeric(prox750),
    A = str_sub(str_pad(exposure, 2, "left", pad = "0"), 1, 1),
    Z = str_sub(str_pad(exposure, 2, "left", pad = "0"), 2, 2),
    exposure = str_pad(exposure, 2, "left", pad = "0"),
    prob_A_0_Z_0 = as.numeric(prob00),
    prob_A_0_Z_1 = as.numeric(prob01),
    prob_A_1_Z_0 = as.numeric(prob10),
    prob_A_1_Z_1 = as.numeric(prob11),
    Y_A_0_Z_0 = y00,
    Y_A_0_Z_1 = y01,
    Y_A_1_Z_0 = y10,
    Y_A_1_Z_1 = y11,
    Y = y
  ) |>
  zap_label() |>
  zap_labels() |>
  zap_formats() |>
  bind_cols(coords) |>
  relocate(x, y, .after = hotspot)

table_8_4_distmat <- as.matrix(dist(coords))

# table_8_7 ----

table_8_7 <-
  read_csv(d081_file(42359), show_col_types = FALSE) |>
  pivot_longer(
    cols = -Market,
    names_to = c(".value", "period"),
    names_pattern = "(.+)_(\\d+)"
  ) |>
  transmute(
    market = Market,
    period,
    prob_P_0_C_0 = case_when(period == "1" ~ 0.75, period == "2" ~ 0.50, period == "3" ~ 0.25),
    prob_P_0_C_1 = 0.25,
    prob_P_1_C_1 = case_when(period == "1" ~ 0, period == "2" ~ 0.25, period == "3" ~ 0.50),
    Y_P_0_C_0 = Y00,
    Y_P_0_C_1 = Y01,
    Y_P_1_C_1 = Y11
  )

# table_9_1 ----

# The archive stores the Rosen response rates as a two-row wide table, one row
# of percentages over one row of cell sizes.

table_9_1 <-
  read_csv(d081_file(42290), show_col_types = FALSE) |>
  rename(quantity = 1) |>
  pivot_longer(-quantity, names_to = "cell") |>
  pivot_wider(names_from = quantity, values_from = value) |>
  transmute(
    Z_author = if_else(str_starts(cell, "Colin"), "colin", "jose"),
    Z_good_grammar = str_detect(cell, "GoodG"),
    Y_reply_pct = Pct_Received_Reply,
    N = as.integer(N)
  )

# table_9_2 ----

table_9_2 <-
  read_csv(d081_file(42308), show_col_types = FALSE) |>
  rename(quantity = 1) |>
  pivot_longer(-quantity, names_to = "cell") |>
  pivot_wider(names_from = quantity, values_from = value) |>
  transmute(
    X_legislator_hispanic = str_ends(cell, "_HL"),
    Z_author = if_else(str_starts(cell, "Colin"), "colin", "jose"),
    Z_good_grammar = str_detect(cell, "GoodG"),
    Y_reply_pct = Pct_Received_Reply,
    N = as.integer(N)
  )

# table_10_1 ----

table_10_1 <-
  read_csv(d081_file(42270), show_col_types = FALSE) |>
  transmute(
    population_share = 1 / 6,
    Z,
    M_Z_0 = M0,
    M_Z_1 = M1,
    M,
    Y_Z_0 = Y0,
    Y_Z_1 = Y1,
    Y,
    e1,
    e3
  )

# table_12_2 ----

# Not from the archive. Chapters 12.2 and 12.5 are new in this edition, and
# their tables are authored in the manuscript rather than drawn from D081, so
# the values are written out here. The population counts come from the Minnesota
# tax compliance experiment that the example is built on; the effects are
# stipulated.

table_12_2 <- tribble(
  ~income,  ~opportunity, ~N_pop,  ~effect,
  "low",    "low",        449017,      0.1,
  "low",    "high",         2120,      0.1,
  "medium", "low",       1290233,      0.4,
  "medium", "high",        50920,     -1.5,
  "high",   "low",         52093,     -5.0,
  "high",   "high",         8456,    -20.0
)

# table_12_5 ----

# Also authored in the manuscript. A tailored-treatment schedule in which the
# content of treatment depends on the subject's type.

table_12_5 <- tribble(
  ~type,     ~Y_Z_0, ~Y_Z_1,
  "honest",      60,     55,
  "honest",      45,     60,
  "corrupt",     50,     45,
  "corrupt",     40,     50
)

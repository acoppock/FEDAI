# Datasets. Every entry gives dimensions, a description of each column, and the
# file in ISPS study D081 it was built from; `data-raw/` holds the build code.
# Potential outcomes are named for the assignment that would reveal them:
# `Y_Z_0` is the outcome if untreated, `Y_Z_1` the outcome if treated.

# Book tables ----

#' Table 2.1 from FEDAI
#'
#' This hypothetical dataset shows the treated (`Y_Z_1`) and untreated (`Y_Z_0`)
#' potential outcomes for all seven villages, as well as a column for their
#' difference, the village-level treatment effect `tau_i`.
#'
#' @format A data frame with 7 rows and 4 columns:
#' \describe{
#'   \item{Village}{Village number, 1 to 7}
#'   \item{Y_Z_0}{Untreated potential outcome}
#'   \item{Y_Z_1}{Treated potential outcome}
#'   \item{tau_i}{Village-level treatment effect, `Y_Z_1 - Y_Z_0`}
#' }
#' @source ISPS Data Archive study D081 \doi{10.60600/YU/VUH8KD}, file 42291
#'   (`GerberGreenBook_Chapter2_Table_2_1`). Built by `data-raw/book_tables.R`.
"table_2_1"

#' Table 2.2 from FEDAI
#'
#' This hypothetical dataset shows a realized assignment (`Z`) and the
#' corresponding revealed outcome (`Y`). Unobserved treated (`Y_Z_1`) and
#' untreated (`Y_Z_0`) potential outcomes are marked as `NA`, as is the
#' village-level treatment effect `tau_i`.
#'
#' @format A data frame with 7 rows and 6 columns:
#' \describe{
#'   \item{Village}{Village number, 1 to 7}
#'   \item{Z}{Realized treatment assignment, 1 for the two treated villages}
#'   \item{Y_Z_0}{Untreated potential outcome, `NA` where treatment was assigned}
#'   \item{Y_Z_1}{Treated potential outcome, `NA` where control was assigned}
#'   \item{Y}{Revealed outcome}
#'   \item{tau_i}{Village-level treatment effect, `NA` throughout: it is never
#'     observable}
#' }
#' @source Derived from Table 2.1 (file 42291) by applying the assignment
#'   printed in the book. Built by `data-raw/book_tables.R`.
"table_2_2"

#' Table 3.3 from FEDAI
#'
#' This hypothetical dataset has the treated (`Y_Z_1`) and untreated (`Y_Z_0`)
#' potential outcomes for 14 villages in two blocks.
#'
#' @format A data frame with 14 rows and 4 columns:
#' \describe{
#'   \item{Village}{Village number, 1 to 14}
#'   \item{Block}{Block, 1 or 2}
#'   \item{Y_Z_0}{Untreated potential outcome}
#'   \item{Y_Z_1}{Treated potential outcome}
#' }
#' @source ISPS Data Archive study D081 \doi{10.60600/YU/VUH8KD}, file 42294
#'   (`GerberGreenBook_Chapter3_Table_3_3`). Built by `data-raw/book_tables.R`.
"table_3_3"

#' Table 3.4 from FEDAI
#'
#' Hypothetical schedule of potential outcomes for 14 villages under
#' noncompliance. `D` and `Y` are character columns because the table prints
#' `"."` for the potential outcome that assignment did not reveal.
#'
#' @format A data frame with 14 rows and 4 columns:
#' \describe{
#'   \item{Village}{Village number, 1 to 14}
#'   \item{Block}{Block, 1 or 2}
#'   \item{D}{Treated potential outcome, `"."` where unrevealed}
#'   \item{Y}{Untreated potential outcome, `"."` where unrevealed}
#' }
#' @source ISPS Data Archive study D081 \doi{10.60600/YU/VUH8KD}, file 42353
#'   (`GerberGreenBook_Chapter3_Table_3_4`). Built by `data-raw/book_tables.R`.
"table_3_4"

#' Table 3.5 from FEDAI
#'
#' The same schedule as Table 3.4, regrouped into three blocks and without the
#' village identifier.
#'
#' @format A data frame with 14 rows and 3 columns:
#' \describe{
#'   \item{Block}{Block, 1 to 3}
#'   \item{D}{Treated potential outcome, `"."` where unrevealed}
#'   \item{Y}{Untreated potential outcome, `"."` where unrevealed}
#' }
#' @source ISPS Data Archive study D081 \doi{10.60600/YU/VUH8KD}, file 42312
#'   (`GerberGreenBook_Chapter3_Table_3_5`). Built by `data-raw/book_tables.R`.
"table_3_5"

#' Table 3.6 from FEDAI
#'
#' Hypothetical potential outcomes for 12 classrooms in 4 schools, in the case
#' where cluster means vary a lot across schools. Paired with Table 3.7, which
#' holds the individual outcomes fixed and varies only how they are grouped.
#'
#' @format A data frame with 12 rows and 6 columns:
#' \describe{
#'   \item{school}{School, A to D}
#'   \item{classroom}{Classroom within school, e.g. `"A-1"`}
#'   \item{Y_Z_0}{Untreated potential outcome}
#'   \item{Y_Z_1}{Treated potential outcome}
#'   \item{Y_cluster_mean_Z_0}{School mean of `Y_Z_0`}
#'   \item{Y_cluster_mean_Z_1}{School mean of `Y_Z_1`}
#' }
#' @source ISPS Data Archive study D081 \doi{10.60600/YU/VUH8KD}, file 42283
#'   (`GerberGreenBook_Chapter3_Table_3_6`). Built by `data-raw/book_tables.R`.
"table_3_6"

#' Table 3.7 from FEDAI
#'
#' Hypothetical potential outcomes for 12 classrooms in 4 schools, in the case
#' where cluster means barely vary across schools. The individual outcomes are
#' the same ones as in Table 3.6; only their assignment to schools differs,
#' which is what makes the pair a demonstration that what matters is how much
#' cluster means differ, not how many clusters there are.
#'
#' @format A data frame with 12 rows and 6 columns:
#' \describe{
#'   \item{school}{School, A to D}
#'   \item{classroom}{Classroom within school, e.g. `"A-1"`}
#'   \item{Y_Z_0}{Untreated potential outcome}
#'   \item{Y_Z_1}{Treated potential outcome}
#'   \item{Y_cluster_mean_Z_0}{School mean of `Y_Z_0`}
#'   \item{Y_cluster_mean_Z_1}{School mean of `Y_Z_1`}
#' }
#' @source ISPS Data Archive study D081 \doi{10.60600/YU/VUH8KD}, file 42370
#'   (`GerberGreenBook_Chapter3_Table_3_7`). Built by `data-raw/book_tables.R`.
"table_3_7"

#' Box 3.7 from FEDAI
#'
#' This hypothetical dataset has two columns, a realized treatment (`Z`) and a
#' revealed outcome (`Y`). The purpose of the dataset is to illustrate how
#' traditional t-tests and randomization inference can yield different answers.
#'
#' @format A data frame with 20 rows and 2 columns:
#' \describe{
#'   \item{Z}{Realized treatment assignment}
#'   \item{Y}{Revealed outcome, a donation amount. The distribution is skewed:
#'     most donations are small and one is 500, which is what pulls the t-test
#'     and randomization inference apart}
#' }
#' @source ISPS Data Archive study D081 \doi{10.60600/YU/VUH8KD}, file 42300
#'   (`GerberGreenBook_Chapter3_Donations`). Built by `data-raw/book_tables.R`.
"box_3_7"

#' Table 4.1 from FEDAI
#'
#' Schedule of potential outcomes and pretest scores for a simulated teacher
#' incentives experiment.
#'
#' @format A data frame with 40 rows and 6 columns:
#' \describe{
#'   \item{observation}{Subject number, 1 to 40}
#'   \item{X_pretest}{Pretest score, strongly predictive of the outcome}
#'   \item{X_pretest_weak}{Pretest score, weakly predictive of the outcome}
#'   \item{Z}{Realized treatment assignment}
#'   \item{Y_Z_0}{Untreated potential outcome}
#'   \item{Y_Z_1}{Treated potential outcome}
#' }
#' @source ISPS Data Archive study D081 \doi{10.60600/YU/VUH8KD}, file 42368
#'   (`GerberGreenBook_Chapter4_Table_4_1`). Built by `data-raw/book_tables.R`.
"table_4_1"

#' Table 4.2 from FEDAI
#'
#' The teacher incentives experiment of Table 4.1 under block random
#' assignment. Assignment probabilities differ across blocks, so the design
#' needs weights.
#'
#' @format A data frame with 40 rows and 9 columns:
#' \describe{
#'   \item{observation}{Subject number, matching Table 4.1}
#'   \item{block}{Block, one of three religious-composition strata}
#'   \item{X_pretest}{Pretest score, strongly predictive of the outcome}
#'   \item{X_pretest_weak}{Pretest score, weakly predictive of the outcome}
#'   \item{Z}{Realized treatment assignment under blocking}
#'   \item{prob}{Probability of assignment to treatment in this subject's block}
#'   \item{wt}{Inverse-probability weight}
#'   \item{Y_Z_0}{Untreated potential outcome}
#'   \item{Y_Z_1}{Treated potential outcome}
#' }
#' @source ISPS Data Archive study D081 \doi{10.60600/YU/VUH8KD}, file 42335
#'   (`GerberGreenBook_Chapter4_Combined_Table_4_1_4_2`). Built by
#'   `data-raw/book_tables.R`.
"table_4_2"

#' Table 5.1 from FEDAI
#'
#' Hypothetical schedule of potential outcomes assuming one-sided
#' noncompliance: no one assigned to control can take the treatment, so there
#' are no always-takers and no defiers.
#'
#' @format A data frame with 9 rows and 6 columns:
#' \describe{
#'   \item{observation}{Subject number, 1 to 9}
#'   \item{type}{Compliance type, Complier or Never-Taker}
#'   \item{D_Z_0}{Treatment received if assigned to control, 0 for everyone}
#'   \item{D_Z_1}{Treatment received if assigned to treatment}
#'   \item{Y_D_0}{Outcome if untreated}
#'   \item{Y_D_1}{Outcome if treated}
#' }
#' @source ISPS Data Archive study D081 \doi{10.60600/YU/VUH8KD}, file 42330
#'   (`GerberGreenBook_Chapter5_Table_5_1`). Built by `data-raw/book_tables.R`.
"table_5_1"

#' Table 6.1 from FEDAI
#'
#' Hypothetical schedule of potential outcomes assuming two-sided
#' noncompliance, so all four compliance types are present, defiers included.
#'
#' @format A data frame with 10 rows and 8 columns:
#' \describe{
#'   \item{observation}{Subject number, 1 to 10}
#'   \item{type}{Compliance type: Complier, Defier, Always-Taker or Never-Taker}
#'   \item{D_Z_0}{Treatment received if assigned to control}
#'   \item{D_Z_1}{Treatment received if assigned to treatment}
#'   \item{Y_D_0}{Outcome if untreated}
#'   \item{Y_D_1}{Outcome if treated}
#'   \item{Y_Z_0}{Outcome if assigned to control}
#'   \item{Y_Z_1}{Outcome if assigned to treatment}
#' }
#' @source ISPS Data Archive study D081 \doi{10.60600/YU/VUH8KD}, file 42280
#'   (`GerberGreenBook_Chapter6_Table_6_1`). Built by `data-raw/book_tables.R`.
"table_6_1"

#' Table 6.4 from FEDAI
#'
#' Hypothetical schedule of potential outcomes and assigned treatments for the
#' illustration of a downstream experiment.
#'
#' @format A data frame with 32 rows and 8 columns:
#' \describe{
#'   \item{observation}{Subject number, 1 to 32}
#'   \item{subject_type}{Compliance type: always-takers, compliers, defiers or
#'     never-takers}
#'   \item{Z}{Realized treatment assignment}
#'   \item{wt}{Number of subjects of this type, used as a frequency weight}
#'   \item{D_Z_0}{Treatment received if assigned to control}
#'   \item{D_Z_1}{Treatment received if assigned to treatment}
#'   \item{Y_D_0}{Outcome if untreated}
#'   \item{Y_D_1}{Outcome if treated}
#' }
#' @source ISPS Data Archive study D081 \doi{10.60600/YU/VUH8KD}, file 42309
#'   (`GerberGreenBook_Chapter6_Table_6_4`). Built by `data-raw/book_tables.R`.
"table_6_4"

#' Table 7.1 from FEDAI
#'
#' Hypothetical potential outcomes for eight subjects, with a reporting
#' potential outcome alongside the outcome itself. Attrition is a potential
#' outcome too, so each subject has a type describing when they report.
#'
#' @format A data frame with 8 rows and 8 columns:
#' \describe{
#'   \item{observation}{Subject number, 1 to 8}
#'   \item{type}{Reporting type implied by `R_Z_0` and `R_Z_1`: Always-reporter,
#'     If-treated-reporter, If-untreated-reporter or Never-reporter}
#'   \item{R_Z_0}{Reports if assigned to control}
#'   \item{R_Z_1}{Reports if assigned to treatment}
#'   \item{Y_Z_0}{Untreated potential outcome, latent}
#'   \item{Y_Z_1}{Treated potential outcome, latent}
#'   \item{Y_Z_0_R_Z_0}{Outcome observed under control, `NA` when the subject
#'     does not report}
#'   \item{Y_Z_1_R_Z_1}{Outcome observed under treatment, `NA` when the subject
#'     does not report}
#' }
#' @source ISPS Data Archive study D081 \doi{10.60600/YU/VUH8KD}, file 42354
#'   (`GerberGreenBook_Chapter7_Table_7_1`). Built by `data-raw/book_tables.R`.
"table_7_1"

#' Table 7.2 from FEDAI
#'
#' Complete set of potential outcomes and covariates for eight subjects, adding
#' a binary covariate to the reporting schedule of Table 7.1.
#'
#' @format A data frame with 8 rows and 8 columns:
#' \describe{
#'   \item{observation}{Subject number, 1 to 8}
#'   \item{X}{Binary pre-treatment covariate}
#'   \item{R_Z_0}{Reports if assigned to control}
#'   \item{R_Z_1}{Reports if assigned to treatment}
#'   \item{Y_Z_0}{Untreated potential outcome, latent}
#'   \item{Y_Z_1}{Treated potential outcome, latent}
#'   \item{Y_Z_0_R_Z_0}{Outcome observed under control, `NA` when unreported}
#'   \item{Y_Z_1_R_Z_1}{Outcome observed under treatment, `NA` when unreported}
#' }
#' @source ISPS Data Archive study D081 \doi{10.60600/YU/VUH8KD}, file 42286
#'   (`GerberGreenBook_Chapter7_Table_7_2`). Built by `data-raw/book_tables.R`.
"table_7_2"

#' Table 7.7 from FEDAI
#'
#' Hypothetical paired potential outcomes with attrition for four subjects.
#'
#' @format A data frame with 4 rows and 8 columns:
#' \describe{
#'   \item{observation}{Subject number, 1 to 4}
#'   \item{Pair}{Matched pair, A or B}
#'   \item{R_Z_0}{Reports if assigned to control, 1 for everyone}
#'   \item{R_Z_1}{Reports if assigned to treatment}
#'   \item{Y_Z_0}{Untreated potential outcome}
#'   \item{Y_Z_1}{Treated potential outcome}
#'   \item{Y_Z_0_R_Z_0}{Outcome observed under control}
#'   \item{Y_Z_1_R_Z_1}{Outcome observed under treatment, the character string
#'     `"Missing"` for the subject who attrites. The column is character rather
#'     than numeric because the book's table prints the word}
#' }
#' @source ISPS Data Archive study D081 \doi{10.60600/YU/VUH8KD}, file 42265
#'   (`GerberGreenBook_Chapter7_Table_7_7`). Built by `data-raw/book_tables.R`.
"table_7_7"

#' Table 8.1 from FEDAI
#'
#' Hypothetical potential outcomes for three employees depending on who is
#' honored with an employee of the month award. Each subject has one potential
#' outcome per possible recipient, which is what interference means here.
#'
#' @format A data frame with 3 rows and 5 columns:
#' \describe{
#'   \item{observation}{Employee: Mary, Peter or Limor}
#'   \item{Y_Z_Mary}{Outcome if Mary is honored}
#'   \item{Y_Z_Peter}{Outcome if Peter is honored}
#'   \item{Y_Z_Limor}{Outcome if Limor is honored}
#'   \item{Y_Z_Nobody}{Outcome if no one is honored}
#' }
#' @source ISPS Data Archive study D081 \doi{10.60600/YU/VUH8KD}, file 42352
#'   (`GerberGreenBook_Chapter8_Table_8_1`). Built by `data-raw/book_tables.R`.
"table_8_1"

#' Table 8.2 from FEDAI
#'
#' Hypothetical potential outcomes for five villages depending on their own
#' treatment status (`Z`) and that of an adjacent village (`A`).
#'
#' @format A data frame with 5 rows and 4 columns:
#' \describe{
#'   \item{observation}{Village number, 1 to 5}
#'   \item{Y_A_0_Z_0}{Outcome when neither the village nor its neighbor is
#'     treated}
#'   \item{Y_A_1_Z_0}{Outcome when the neighbor is treated and the village is
#'     not, the spillover condition. `NA` for the village with no neighbor}
#'   \item{Y_A_0_Z_1}{Outcome when the village is treated and the neighbor is
#'     not}
#' }
#' @source ISPS Data Archive study D081 \doi{10.60600/YU/VUH8KD}, file 42380
#'   (`GerberGreenBook_Chapter8_Table_8_2`). Built by `data-raw/book_tables.R`.
"table_8_2"

#' Table 8.4 from FEDAI
#'
#' Hypothetical potential outcomes for 30 policing hotspots, depending on their
#' own treatment status (`Z`) and on whether a nearby hotspot is treated (`A`).
#' Because exposure to spillover is itself random, each hotspot has a
#' probability of landing in each of the four exposure conditions.
#'
#' @format A data frame with 30 rows and 17 columns:
#' \describe{
#'   \item{hotspot}{Hotspot number, 1 to 30}
#'   \item{x, y}{Coordinates in the plane}
#'   \item{hotspots_within_500m}{Number of other hotspots within 500m}
#'   \item{hotspots_within_750m}{Number of other hotspots within 750m}
#'   \item{A}{Realized spillover exposure, `"0"` or `"1"`}
#'   \item{Z}{Realized direct treatment, `"0"` or `"1"`}
#'   \item{exposure}{Two-character exposure condition, `A` followed by `Z`}
#'   \item{prob_A_0_Z_0, prob_A_0_Z_1, prob_A_1_Z_0, prob_A_1_Z_1}{Probability of
#'     each exposure condition under the randomization}
#'   \item{Y_A_0_Z_0, Y_A_0_Z_1, Y_A_1_Z_0, Y_A_1_Z_1}{Potential outcome in each
#'     exposure condition}
#'   \item{Y}{Revealed outcome}
#' }
#' @source ISPS Data Archive study D081 \doi{10.60600/YU/VUH8KD}, file 42273
#'   (`GerberGreenBook_Chapter8_Table_8_4_8_5`). The coordinates are not stored
#'   in the archive as data; they are regenerated from the `set.seed(1337)` draw
#'   in the archive's own Chapter 8 figure code (file 42377). Built by
#'   `data-raw/book_tables.R`.
"table_8_4"

#' Distance matrix for Table 8.4 from FEDAI
#'
#' Euclidean distances between the 30 policing hotspots of `table_8_4`, which
#' determine which hotspots are exposed to a treated neighbor.
#'
#' @format A 30 by 30 numeric matrix. Row and column `i` correspond to
#'   `table_8_4$hotspot == i`, and the diagonal is zero.
#' @source Computed from the hotspot coordinates described under `table_8_4`.
#'   Built by `data-raw/book_tables.R`.
"table_8_4_distmat"

#' Table 8.7 from FEDAI
#'
#' Hypothetical potential outcomes for eight media markets over three periods,
#' depending on current and previous period treatment status. Treatment is
#' sticky, so the twice-treated potential outcome does not exist in period 1.
#'
#' @format A data frame with 24 rows and 8 columns:
#' \describe{
#'   \item{market}{Market number, 1 to 8}
#'   \item{period}{Period, `"1"` to `"3"`}
#'   \item{prob_P_0_C_0}{Probability of being untreated in both the previous and
#'     the current period}
#'   \item{prob_P_0_C_1}{Probability of being newly treated this period}
#'   \item{prob_P_1_C_1}{Probability of having been treated in both periods}
#'   \item{Y_P_0_C_0}{Outcome when untreated in both periods}
#'   \item{Y_P_0_C_1}{Outcome when newly treated}
#'   \item{Y_P_1_C_1}{Outcome when treated in both periods, `NA` in period 1}
#' }
#' @source ISPS Data Archive study D081 \doi{10.60600/YU/VUH8KD}, file 42359
#'   (`GerberGreenBook_Chapter8_Table_8_7`). Built by `data-raw/book_tables.R`.
"table_8_7"

#' Table 9.1 from FEDAI
#'
#' Aggregate reply rates from Rosen (2010), one row per treatment cell, in tidy
#' rather than printed-table form.
#'
#' @format A data frame with 4 rows and 4 columns:
#' \describe{
#'   \item{Z_author}{Apparent ethnicity of the letter writer, `"colin"` or
#'     `"jose"`}
#'   \item{Z_good_grammar}{Whether the letter used good grammar}
#'   \item{Y_reply_pct}{Percent of legislators who replied}
#'   \item{N}{Letters sent in this cell}
#' }
#' @source ISPS Data Archive study D081 \doi{10.60600/YU/VUH8KD}, file 42290
#'   (`GerberGreenBook_Chapter9_Table_9_1`). Built by `data-raw/book_tables.R`.
"table_9_1"

#' Table 9.2 from FEDAI
#'
#' Aggregate reply rates from Rosen (2010), stratified by whether the legislator
#' is Hispanic. The moderator is a pre-treatment characteristic of the
#' legislator, not of the letter.
#'
#' @format A data frame with 8 rows and 5 columns:
#' \describe{
#'   \item{X_legislator_hispanic}{Whether the recipient legislator is Hispanic}
#'   \item{Z_author}{Apparent ethnicity of the letter writer}
#'   \item{Z_good_grammar}{Whether the letter used good grammar}
#'   \item{Y_reply_pct}{Percent of legislators who replied}
#'   \item{N}{Letters sent in this cell}
#' }
#' @source ISPS Data Archive study D081 \doi{10.60600/YU/VUH8KD}, file 42308
#'   (`GerberGreenBook_Chapter9_Table_9_2`). Built by `data-raw/book_tables.R`.
"table_9_2"

#' Table 10.1 from FEDAI
#'
#' Hypothetical potential outcomes for six kinds of subjects, used to show why
#' regressing the outcome on a post-treatment mediator does not recover the
#' effect that runs through it.
#'
#' @format A data frame with 6 rows and 10 columns:
#' \describe{
#'   \item{population_share}{Share of the population of this subject type, 1/6
#'     throughout}
#'   \item{Z}{Realized treatment assignment}
#'   \item{M_Z_0}{Mediator if untreated}
#'   \item{M_Z_1}{Mediator if treated}
#'   \item{M}{Revealed mediator}
#'   \item{Y_Z_0}{Untreated potential outcome}
#'   \item{Y_Z_1}{Treated potential outcome}
#'   \item{Y}{Revealed outcome}
#'   \item{e1}{Disturbance in the mediator equation}
#'   \item{e3}{Disturbance in the outcome equation}
#' }
#' @source ISPS Data Archive study D081 \doi{10.60600/YU/VUH8KD}, file 42270
#'   (`GerberGreenBook_Chapter10_Table_10_1`). Built by
#'   `data-raw/book_tables.R`.
"table_10_1"

#' Table 12.2 from FEDAI
#'
#' Strata for an oversampling illustration built on the Slemrod, Blumenthal and
#' Christian (2001) tax compliance experiment. Six strata are defined by income
#' level and self-reported opportunity to underreport. The smallest stratum has
#' the largest effect, which is the case for oversampling it.
#'
#' @format A data frame with 6 rows and 4 columns:
#' \describe{
#'   \item{income}{Income level: low, medium or high}
#'   \item{opportunity}{Opportunity to underreport: low or high}
#'   \item{N_pop}{Population size of the stratum}
#'   \item{effect}{Stipulated true ATE within the stratum, in percentage points
#'     of reported income}
#' }
#' @source Authored for this edition rather than taken from the archive. The
#'   stratum sizes come from the Minnesota tax compliance experiment; the
#'   effects are stipulated. Built by `data-raw/book_tables.R`.
"table_12_2"

#' Table 12.5 from FEDAI
#'
#' Hypothetical potential outcomes for a tailored-treatment design based on the
#' Chong, De La O, Karlan and Wantchekon (2011) municipal audit experiment. The
#' content of treatment depends on the subject's type, so some cells of the
#' schedule of potential outcomes are never observable.
#'
#' @format A data frame with 4 rows and 3 columns:
#' \describe{
#'   \item{type}{Municipality type, honest or corrupt}
#'   \item{Y_Z_0}{Turnout under control}
#'   \item{Y_Z_1}{Turnout under the treatment tailored to that type}
#' }
#' @source Authored for this edition rather than taken from the archive. Built
#'   by `data-raw/book_tables.R`.
"table_12_5"

# Study datasets used in the chapters ----

#' Arceneaux (2005) precinct canvassing experiment
#'
#' Precinct-level cluster-randomized field experiment in Kansas City, Missouri,
#' used in Chapter 3 as the running example of cluster assignment.
#'
#' @format A data frame with 9,712 rows and 4 columns:
#' \describe{
#'   \item{precinct}{Precinct, the unit of random assignment, 1 to 28}
#'   \item{Z}{Assigned to the canvassing treatment}
#'   \item{D_contact}{Contact with the household was successful}
#'   \item{Y_voted_2003}{Voted in the 2003 election}
#' }
#' @source Arceneaux, K. (2005). Using Cluster Randomized Field Experiments to
#'   Study Voting Behavior. The ANNALS of the American Academy of Political and
#'   Social Science, 601(1), 169-179. ISPS Data Archive study D081
#'   \doi{10.60600/YU/VUH8KD}, file 42260 (`Arceneaux_AAAPSSsubset_2005`).
#'   Built by `data-raw/studies.R`.
"arceneaux_2005"

#' Clingingsmith, Khwaja and Kremer (2009) Hajj lottery
#'
#' 958 Pakistani Muslims who applied for Hajj visas allocated by lottery. Used
#' in Chapter 3.
#'
#' @format A data frame with 958 rows and 2 columns:
#' \describe{
#'   \item{Z_hajj}{Won the visa lottery and went on the Hajj}
#'   \item{Y_views}{Index of views toward other Muslim nationalities, from -12
#'     to 12}
#' }
#' @source Clingingsmith, D., Khwaja, A. I. and Kremer, M. (2009). Estimating
#'   the Impact of the Hajj: Religion and Tolerance in Islam's Global Gathering.
#'   The Quarterly Journal of Economics, 124(3), 1133-1170.
#'   \doi{10.1162/qjec.2009.124.3.1133}. ISPS Data Archive study D081
#'   \doi{10.60600/YU/VUH8KD}, file 42299
#'   (`Clingingsmith_et_al_QJE_2009dta`). Built by `data-raw/studies.R`.
"clingingsmith_khwaja_kremer_2009"

#' Rosen (2010) legislator audit experiment
#'
#' 400 letters sent to state legislators in a 2x2 factorial experiment varying
#' the apparent ethnicity of the writer and the quality of the grammar. Used in
#' Chapter 9 as the running example of factorial designs and moderators.
#'
#' @format A data frame with 400 rows and 7 columns:
#' \describe{
#'   \item{observation}{Letter number, 1 to 400}
#'   \item{letter_name}{Name signed on the letter, Colin or Jose}
#'   \item{X_legislator_hispanic}{Recipient legislator is Hispanic}
#'   \item{Z_hispanic}{Letter signed with the Hispanic name}
#'   \item{Z_grammar_label}{Grammar quality, good or bad}
#'   \item{Z_good_grammar}{Letter used good grammar}
#'   \item{Y_response}{Legislator replied}
#' }
#' @source Rosen, J. (2010). The Effects of Race and Grammar Quality on the
#'   Responsiveness of American State Legislators: A Field Experiment.
#'   Unpublished manuscript. ISPS Data Archive study D081
#'   \doi{10.60600/YU/VUH8KD}, file 42255 (`GerberGreebBook_Chapter9_Rosen`).
#'   Built by `data-raw/studies.R`.
"rosen_2010"

# Exercise datasets ----

# These nine keep the column names the archive gave them, because the exercises
# refer to the reader's downloaded file by those names. Where a column's meaning
# is not documented in the exercise or the archive, the entry says what the
# column contains rather than guessing at what it means.

#' O'Brien and Patsiorkovski (1999) rural Russia survey
#'
#' Exercise dataset for Chapter 4, Exercise 4.6. Rural Russian households
#' surveyed over three years, used for an exercise in mock random assignment.
#'
#' @format A data frame with 462 rows and 8 columns:
#' \describe{
#'   \item{sexresp6}{Respondent sex, coded 1 or 2}
#'   \item{ageresp6}{Respondent age in years, 19 to 92}
#'   \item{group6}{Group, 1 to 4}
#'   \item{memberc6}{Membership indicator, coded 1 or 2}
#'   \item{index95}{Outcome index, 1995 wave, 3 to 9}
#'   \item{index96}{Outcome index, 1996 wave, 3 to 9}
#'   \item{index97}{Outcome index, 1997 wave, 3 to 9}
#'   \item{randsort}{Uniform random number, one per household, for sorting into
#'     a mock random assignment}
#' }
#' @source O'Brien, D. J. and Patsiorkovski, V. V. (1999). ISPS Data Archive
#'   study D081 \doi{10.60600/YU/VUH8KD}, file 42331
#'   (`OBrien_Patsiorkovski_ICPSR_1999`). Built by
#'   `data-raw/exercise_datasets.R`.
"obrien_patsiorkovski_1999"

#' Guan and Green (2006) dormitory canvassing experiment
#'
#' Exercise dataset for Chapter 5, Exercise 5.10. Canvassing experiment on voter
#' turnout among Peking University students, randomized within dormitory
#' clusters, with one-sided noncompliance.
#'
#' @format A data frame with 4,024 rows and 4 columns:
#' \describe{
#'   \item{turnout}{Voted, with 2 missing values}
#'   \item{contact}{Successfully contacted by a canvasser}
#'   \item{dormid}{Dormitory identifier, the cluster of assignment}
#'   \item{treat2}{Assigned to the canvassing treatment}
#' }
#' @source Guan, M. and Green, D. P. (2006). Noncoercive Mobilization in
#'   State-Controlled Elections: An Experimental Study in Beijing. Comparative
#'   Political Studies, 39(10), 1175-1193. ISPS Data Archive study D081
#'   \doi{10.60600/YU/VUH8KD}, file 42342 (`Guan_Green_CPS_2006`). Built by
#'   `data-raw/exercise_datasets.R`.
"guan_green_2006"

#' Hyde (2010) election observation experiment
#'
#' Exercise dataset for Chapter 6, Exercise 6.10. Randomized assignment of
#' international election observers to polling stations in Indonesia.
#'
#' @format A data frame with 1,971 rows and 3 columns:
#' \describe{
#'   \item{observed}{Polling station was visited by an observer}
#'   \item{invalidballots}{Count of invalid ballots at the polling station}
#'   \item{Sample}{Sample indicator, 0 or 1}
#' }
#' @source Hyde, S. D. (2010). Experimenting in Democracy Promotion:
#'   International Observers and the 2004 Presidential Elections in Indonesia.
#'   Perspectives on Politics, 8(2), 511-527. ISPS Data Archive study D081
#'   \doi{10.60600/YU/VUH8KD}, file 42372 (`Hyde_POP_2012`). Built by
#'   `data-raw/exercise_datasets.R`.
"hyde_2010"

#' Rind and Bordia (1996) restaurant tipping experiment
#'
#' Exercise dataset for Chapter 9, Exercise 9.6. Servers randomly drew a smiley
#' face on the check or did not; the design crosses that with server sex.
#'
#' @format A data frame with 89 rows and 5 columns:
#' \describe{
#'   \item{female}{Server is female}
#'   \item{happyface}{Smiley face drawn on the check}
#'   \item{tip}{Tip as a percentage of the bill}
#'   \item{xhappy}{Interaction of `female` and `happyface`}
#'   \item{tipround}{Tip rounded to the nearest whole number}
#' }
#' @source Rind, B. and Bordia, P. (1996). Effect on Restaurant Tipping of Male
#'   and Female Servers Drawing a Happy, Smiling Face on the Backs of Customers'
#'   Checks. Journal of Applied Social Psychology, 26(3), 218-225. ISPS Data
#'   Archive study D081 \doi{10.60600/YU/VUH8KD}, file 42341
#'   (`Rind_Bordia_JASP_1996`). Built by `data-raw/exercise_datasets.R`.
"rind_bordia_1996"

#' Fieldhouse et al. (2010) UK mobilization experiment
#'
#' Exercise dataset for Chapter 9, Exercise 9.9. Factorial voter mobilization
#' experiment crossing mail with other forms of contact.
#'
#' @format A data frame with 15,300 rows and 6 columns:
#' \describe{
#'   \item{m}{Assigned to the mail treatment}
#'   \item{p}{Assigned to the phone treatment}
#'   \item{c}{Assigned to the canvassing treatment}
#'   \item{y}{Voted}
#'   \item{p_m}{Interaction of `p` and `m`}
#'   \item{c_m}{Interaction of `c` and `m`}
#' }
#' @source Fieldhouse, E., Cutts, D., Widdop, P. and John, P. (2010). ISPS Data
#'   Archive study D081 \doi{10.60600/YU/VUH8KD}, file 42348
#'   (`Fieldhouse_et_al_unpublished_2010_expanded`). Built by
#'   `data-raw/exercise_datasets.R`.
"fieldhouse_etal_2010"

#' Bhavnani (2009) gender quota experiment
#'
#' Exercise dataset for Chapter 10, Exercise 10.4. Randomly assigned council
#' seat reservations for women in Mumbai, and turnout in the following election.
#'
#' @format A data frame with 227 rows and 4 columns:
#' \describe{
#'   \item{controltreat}{Ward reserved for a woman candidate, with 109 missing
#'     values}
#'   \item{genderofwinner}{Winning candidate is a woman}
#'   \item{turnout}{Turnout percentage in 2002}
#'   \item{turnout97}{Turnout percentage in 1997, with 54 missing values}
#' }
#' @source Bhavnani, R. R. (2009). Do Electoral Quotas Work after They Are
#'   Withdrawn? Evidence from a Natural Experiment in India. American Political
#'   Science Review, 103(1), 23-35. ISPS Data Archive study D081
#'   \doi{10.60600/YU/VUH8KD}, file 42369 (`Bhavnani_APSR_2009`). Built by
#'   `data-raw/exercise_datasets.R`.
"bhavnani_2009"

#' Dupas (2010) bed net pricing experiment
#'
#' Exercise dataset for Chapter 11, Exercises 11.8 and 11.9. Randomly assigned
#' subsidy levels for insecticide-treated bed nets in Kenya.
#'
#' @format A data frame with 1,120 rows and 3 columns:
#' \describe{
#'   \item{cfw_id}{Community health worker identifier, 1 to 6}
#'   \item{price}{Randomly assigned price in Kenyan shillings, 0 to 250, 17
#'     distinct values}
#'   \item{purchasednet}{Whether a net was purchased, `"yes"` or `"no"`. The
#'     column is character rather than an indicator}
#' }
#' @source Dupas, P. (2010). Short-Run Subsidies and Long-Run Adoption of New
#'   Health Products: Evidence from a Field Experiment. Working paper. ISPS Data
#'   Archive study D081 \doi{10.60600/YU/VUH8KD}, file 42278
#'   (`Chapter_11_Dupas_2010_Dataset`). Built by
#'   `data-raw/exercise_datasets.R`.
"dupas_2010"

#' Howell and Peterson (2002) school voucher experiment
#'
#' Exercise dataset for Chapter 12, Exercise 12.11. Lottery-allocated private
#' school vouchers in New York City, used as an exercise on attrition: the
#' missingness indicator is the point of the dataset.
#'
#' @format A data frame with 1,851 rows and 4 columns:
#' \describe{
#'   \item{treat}{Offered a voucher by lottery}
#'   \item{missing_y1math}{Year-one math score is missing}
#'   \item{y0_1math_change}{Change in math score from baseline, missing for 396
#'     subjects}
#'   \item{subset_desc}{Subset indicator, 1 for every row in this extract}
#' }
#' @source Howell, W. G. and Peterson, P. E. (2002). The Education Gap: Vouchers
#'   and Urban Schools. Brookings Institution Press. ISPS Data Archive study
#'   D081 \doi{10.60600/YU/VUH8KD}, file 42361 (`Howell_Peterson_BIP_2002`).
#'   Built by `data-raw/exercise_datasets.R`.
"howell_peterson_2002"

#' Titiunik (2010) legislative term length experiment
#'
#' Exercise dataset for Chapter 13. Texas and Arkansas assign newly elected
#' state senators to two-year or four-year terms by lottery, which makes term
#' length experimentally manipulated rather than chosen.
#'
#' @format A data frame with 124 rows and 6 columns:
#' \describe{
#'   \item{year}{Legislative session. The 1993 sessions are coded 19931 and
#'     19932, so the column has four distinct values rather than three}
#'   \item{party}{Senator's party, `"Dem."` or `"Rep."`}
#'   \item{dshort_term}{Assigned term length, `"2 years"` or `"4 years"`}
#'   \item{votesh_incumb}{Incumbent vote share}
#'   \item{usrepvotesh_dem}{Democratic vote share for US Representative in the
#'     district}
#'   \item{bills_intro}{Bills introduced by the senator}
#' }
#' @source Titiunik, R. (2010). Drawing Your Senator from a Jar: Term Length and
#'   Legislative Behavior. Working paper. ISPS Data Archive study D081
#'   \doi{10.60600/YU/VUH8KD}, file 42333 (`Titiunik_WorkingPaper_2010`). Built
#'   by `data-raw/exercise_datasets.R`.
"titiunik_2010"

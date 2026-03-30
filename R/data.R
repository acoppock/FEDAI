#' arceneaux_2005 from FEDAI
#'
#' Arceneaux, K. (2005). Using Cluster Randomized Field Experiments to Study Voting Behavior. The ANNALS of the American Academy of Political and Social Science, 601(1), 169-179.
#' Precinct-level cluster-randomized field experiment in Kansas City, Missouri. Columns: `precinct`, `Z` (treatment assignment), `D_contact` (whether contact with the household was successful), `Y_voted_2003` (outcome: voted in 2003 election).
#'
#' @format A data.frame
"arceneaux_2005"

#' Box 3.7 from FEDAI
#'
#' This hypothetical dataset has two columns, a realized treatment (`Z`) and a revealed outcome (`Y`). The purpose of the dataset is to illustrate how traditional t-tests and randomization inference can yield different answers
#'
#' @format A data.frame
"box_3_7"

#' clingingsmith_etal_2009 from FEDAI
#'
#' David Clingingsmith, Asim Ijaz Khwaja, Michael Kremer,
#' Estimating the Impact of The Hajj:
#' Religion and Tolerance in Islam's Global Gathering,
#' The Quarterly Journal of Economics, Volume 124, Issue 3, August 2009, Pages 1133–1170,
#' https://doi.org/10.1162/qjec.2009.124.3.1133
#'
#' These data describe 958 Pakistani Muslims who were randomly selected to go on Hajj via lottery. The outcome Y_views describes these individuals' post-treatment views of others.
#'
#' @format A data.frame
"clingingsmith_etal_2009"

#' rosen_2010 from FEDAI
#'
#' Jeff Rosen. The Effects of Race and Grammar Quality on the Responsiveness of American State Legislators: A Field Experiment. Working paper, 2010.
#'
#' 400 letters sent to state legislators in a 2x2 factorial experiment varying the apparent ethnicity of the author and the quality of the grammar. Columns: `observation`, `letter_name` (name used on letter), `X_legislator_hispanic` (1 = legislator is Hispanic), `Z_hispanic` (1 = Hispanic name), `Z_grammar_label` (factor: "good"/"bad"), `Z_good_grammar` (1 = good grammar), `Y_response` (1 = legislator replied).
#'
#' @format A data.frame
"rosen_2010"

#' Table 2.1 from FEDAI
#'
#' This hypothetical dataset shows the treated (`Y_Z_1`) and untreated (`Y_Z_0`) potential outcomes for all seven villages, as well as a column for their difference, the village-level treatment effect `tau_i`
#'
#' @format A data.frame
"table_2_1"

#' Table 2.2 from FEDAI
#'
#' This hypothetical dataset shows a realized assignment (`Z`) and the corresponding revealed outcome (`Y`). Unobserved treated (`Y_Z_1`) and untreated (`Y_Z_0`) potential outcomes are marked as `NA` as is the village-level treatment effect `tau_i`.
#'
#' @format A data.frame
"table_2_2"

#' Table 3.3 from FEDAI
#'
#' This hypothetical dataset has the treated (`Y_Z_1`) and untreated (`Y_Z_0`) potential outcomes for 14 villages in two blocks.
#'
#' @format A data.frame
"table_3_3"

#' Table 3.6 from FEDAI
#'
#' Hypothetical potential outcomes for 12 classrooms in 4 schools (high sampling variability). Columns: `school`, `classroom`, `Y_Z_0`, `Y_Z_1`, `Y_cluster_mean_Z_0`, `Y_cluster_mean_Z_1`.
#'
#' @format A data.frame
"table_3_6"

#' Table 3.7 from FEDAI
#'
#' Hypothetical potential outcomes for 12 classrooms in 4 schools (low sampling variability). Columns: `school`, `classroom`, `Y_Z_0`, `Y_Z_1`, `Y_cluster_mean_Z_0`, `Y_cluster_mean_Z_1`.
#'
#' @format A data.frame
"table_3_7"

#' Table 4.1 from FEDAI
#'
#' Schedule of potential outcomes and pretest scores for a simulated teacher incentives experiment. Columns: `observation`, `X_pretest` (pretest score, strong covariate), `X_pretest_weak` (pretest score, weak covariate), `Z` (realized treatment assignment), `Y_Z_0`, `Y_Z_1`.
#'
#' @format A data.frame
"table_4_1"

#' Table 4.2 from FEDAI
#'
#' Block random assignment of teacher incentives experiment. Columns: `observation`, `block`, `X_pretest`, `X_pretest_weak`, `Z` (realized treatment assignment), `prob` (assignment probability), `wt` (inverse-probability weight), `Y_Z_0`, `Y_Z_1`.
#'
#' @format A data.frame
"table_4_2"

#' Table 5.1 from FEDAI
#'
#' Hypothetical schedule of potential outcomes assuming one-sided noncompliance
#'
#' @format A data.frame
"table_5_1"

#' Table 6.1 from FEDAI
#'
#' Hypothetical schedule of potential outcomes assuming two-sided noncompliance
#'
#' @format A data.frame
"table_6_1"

#' Table 6.4 from FEDAI
#'
#' Hypothetical schedule of potential outcomes and assigned treatments for illustration of a downstream experiment
#'
#' @format A data.frame
"table_6_4"

#' Table 7.1 from FEDAI
#'
#' Hypothetical potential outcomes for eight subjects.
#'
#' @format A data.frame
"table_7_1"

#' Table 7.2 from FEDAI
#'
#' Complete set of potential outcomes and covariates for eight subjects.
#'
#' @format A data.frame
"table_7_2"

#' Table 8.1 from FEDAI
#'
#' Hypothetical potential outcomes for three employees depending on who is honored with an employee of the month award.
#'
#' @format A data.frame
"table_8_1"

#' Table 8.2 from FEDAI
#'
#' Hypothetical potential outcomes for 5 villages depending on their treatment status and the treatment status of adjacent villages.
#'
#' @format A data.frame
"table_8_2"

#' Table 8.4 from FEDAI
#'
#' Hypothetical potential outcomes for 30 policing hotspots locations depending on their treatment status and the treatment status of adjacent hotspots.
#'
#' @format A data.frame
"table_8_4"

#' Distance matrix for Table 8.4 from FEDAI
#'
#' Distance matrix for the 30 hypothetical policing hotspots locations described in Table 8.4
#'
#' @format A data.frame
"table_8_4_distmat"

#' Table 8.7 from FEDAI
#'
#' Hypothetical potential outcomes for 8 media markets over three weeks, depending on current and previous period treatment status.
#'
#' @format A data.frame
"table_8_7"

#' Table 10.1 from FEDAI
#'
#' Hypothetical potential outcomes for six kinds of subjects
#'
#' @format A data.frame
"table_10_1"

#' Table 3.4 from FEDAI
#'
#' Hypothetical schedule of potential outcomes for 14 villages under noncompliance. Columns: `Village`, `Block`, `D` (dose received), `Y` (observed outcome).
#'
#' @format A data.frame
"table_3_4"

#' Table 3.5 from FEDAI
#'
#' Hypothetical schedule of potential outcomes for 14 villages under noncompliance (no Village ID column). Columns: `Block`, `D` (dose received), `Y` (observed outcome).
#'
#' @format A data.frame
"table_3_5"

#' Table 7.7 from FEDAI
#'
#' Hypothetical paired potential outcomes with attrition for four subjects. Columns: `observation`, `Pair`, `R_Z_0` (response indicator under control), `R_Z_1` (response indicator under treatment), `Y_Z_0`, `Y_Z_1`, `Y_Z_0_R_Z_0` (observed outcome if assigned control), `Y_Z_1_R_Z_1` (observed outcome if assigned treatment, "Missing" if attrited).
#'
#' @format A data.frame
"table_7_7"

#' Table 9.1 from FEDAI
#'
#' Tidy aggregate reply rates from Rosen (2010), one row per treatment cell. Columns: `Z_author` ("colin"/"jose"), `Z_good_grammar` (TRUE/FALSE), `Y_reply_pct` (percent of legislators who replied), `N` (observations per cell).
#'
#' @format A data.frame
"table_9_1"

#' Table 9.2 from FEDAI
#'
#' Tidy aggregate reply rates from Rosen (2010) stratified by legislator ethnicity. Columns: `X_legislator_hispanic` (TRUE/FALSE), `Z_author`, `Z_good_grammar`, `Y_reply_pct`, `N`.
#'
#' @format A data.frame
"table_9_2"

#' Table 12.2 from FEDAI
#'
#' Slemrod, Blumenthal, and Christian (2001) tax compliance strata. Six strata defined by income level (low/medium/high) and self-reported opportunity to underreport (low/high). Columns: income, opportunity, N_pop (stratum population size), effect (true ATE within stratum in percentage points of reported income).
#'
#' @format A data.frame
"table_12_2"

#' Table 12.5 from FEDAI
#'
#' Hypothetical potential outcomes for the Chong, De La O, Karlan, and Wantchekon (2011) municipal audit information experiment. Columns: type (honest or corrupt municipality), Y_Z_0 (turnout under control), Y_Z_1 (turnout under treatment).
#'
#' @format A data.frame
"table_12_5"





#' obrien_patsiorkovski_1999 from FEDAI
#'
#' O'Brien, D. J. and Patsiorkovski, V. V. (1999). Exercise dataset for FEDAI Chapter 4 (Exercise 4.6). Rural Russia survey data on resource group membership and outcome indices across three years.
#' Columns: `sexresp6` (respondent sex), `ageresp6` (respondent age), `group6` (treatment group), `memberc6` (group membership count), `index95`, `index96`, `index97` (outcome indices across years), `randsort` (randomization sort variable).
#'
#' @format A data.frame
"obrien_patsiorkovski_1999"

#' guan_green_2006 from FEDAI
#'
#' Guan, M. and Green, D. P. (2006). Exercise dataset for FEDAI Chapter 5 (Exercise 5.10). Dorm-based canvassing experiment on voter turnout.
#' Columns: `turnout` (1 = voted), `contact` (1 = contacted), `dormid` (dormitory identifier), `treat2` (treatment assignment indicator).
#'
#' @format A data.frame
"guan_green_2006"

#' hyde_2010 from FEDAI
#'
#' Hyde, S. D. (2010). Exercise dataset for FEDAI Chapter 6 (Exercise 6.10). International election observation experiment examining invalid ballots.
#' Columns: `observed` (1 = polling station was observed), `invalidballots` (count of invalid ballots), `Sample` (sample group indicator).
#'
#' @format A data.frame
"hyde_2010"

#' rind_bordia_1996 from FEDAI
#'
#' Rind, B. and Bordia, P. (1996). Exercise dataset for FEDAI Chapter 9 (Exercise 9.6). Experiment on the effect of a server drawing a smiley face on restaurant tips.
#' Columns: `female` (1 = female server), `happyface` (1 = smiley face drawn on check), `tip` (tip amount in cents), `xhappy` (interaction term), `tipround` (rounded tip).
#'
#' @format A data.frame
"rind_bordia_1996"

#' fieldhouse_etal_2010 from FEDAI
#'
#' Fieldhouse, E. et al. (2010). Exercise dataset for FEDAI Chapter 9 (Exercise 9.9). Multi-level canvassing experiment on voter turnout.
#' Columns: `m` (mobilization treatment), `p` (party contact), `c` (canvassing treatment), `y` (turnout outcome), `p_m` (party-mobilization interaction), `c_m` (canvassing-mobilization interaction).
#'
#' @format A data.frame
"fieldhouse_etal_2010"

#' bhavnani_2009 from FEDAI
#'
#' Bhavnani, R. R. (2009). Exercise dataset for FEDAI Chapter 10 (Exercise 10.4). Study of gender quotas and voter turnout in India.
#' Columns: `controltreat` (control/treatment indicator), `genderofwinner` (gender of winning candidate), `turnout` (voter turnout), `turnout97` (1997 baseline turnout).
#'
#' @format A data.frame
"bhavnani_2009"

#' dupas_2010 from FEDAI
#'
#' Dupas, P. (2010). Exercise dataset for FEDAI Chapter 11 (Exercises 11.8, 11.9). Field experiment on bed net purchase and price subsidies in Kenya.
#' Columns: `cfw_id` (community health worker identifier), `price` (price offered for bed net), `purchasednet` (whether net was purchased).
#'
#' @format A data.frame
"dupas_2010"

#' howell_peterson_2002 from FEDAI
#'
#' Howell, W. G. and Peterson, P. E. (2002). Exercise dataset for FEDAI Chapter 12 (Exercise 12.11). School voucher experiment examining math achievement.
#' Columns: `treat` (1 = voucher offered), `missing_y1math` (1 = missing year-1 math score), `y0_1math_change` (change in math score from baseline), `subset_desc` (subset description indicator).
#'
#' @format A data.frame
"howell_peterson_2002"

#' titiunik_2010 from FEDAI
#'
#' Titiunik, R. (2010). Exercise dataset for FEDAI Chapter 13. Regression discontinuity dataset on term lengths and legislative productivity.
#' Columns: `year` (legislative year), `party` (party affiliation), `dshort_term` (short-term indicator), `votesh_incumb` (incumbent vote share), `usrepvotesh_dem` (US representative Democratic vote share), `bills_intro` (bills introduced).
#'
#' @format A data.frame
"titiunik_2010"

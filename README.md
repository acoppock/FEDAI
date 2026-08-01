# FEDAI

<!-- badges: start -->
[![R-CMD-check](https://github.com/acoppock/FEDAI/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/acoppock/FEDAI/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The tables, study datasets, and helper functions used in *Field Experiments:
Design, Analysis, and Interpretation*, by Alan S. Gerber and Donald P. Green.

```r
# install.packages("remotes")
remotes::install_github("acoppock/FEDAI")
```

## What is in it

**38 datasets.** The hypothetical tables the book reasons over, the study
datasets the chapters analyze, and the nine datasets the exercises ask the
reader to download. Every dataset is documented with its dimensions, a
description of each column, and the archive file it came from:

```r
library(FEDAI)

table_2_1        # the seven villages, with both potential outcomes
arceneaux_2005   # precinct-level cluster-randomized canvassing
titiunik_2010    # senators assigned two- or four-year terms by lottery

?table_2_1       # dimensions, columns, and source
data(package = "FEDAI")
```

Potential outcomes are named for the assignment that would reveal them, so
`Y_Z_0` is the outcome if untreated and `Y_Z_1` the outcome if treated. Where a
second dimension of assignment matters the name grows: `Y_A_1_Z_0` in Table 8.4
is the outcome for a hotspot whose neighbor is treated while it is not.

**A few helper functions.**

| Function | What it does |
|---|---|
| `pop_var()`, `pop_cov()`, `pop_sd()` | Divide by `N` rather than `N - 1`, which is what a schedule of potential outcomes calls for |
| `equation_3.4()` | The true standard error of a two-arm experiment under complete random assignment |
| `difference_in_variances()` | Difference in outcome variances between arms, with the F test p-value |
| `posterior_mean_fn()`, `simulate_posteriors()` | Bayesian updating from an experimental result, Chapter 11 |
| `make_studies()` | Simulate a research literature with a moderator, Chapter 11 |

## Where the data came from

Every dataset except two is built from the ISPS Data Archive's study D081,
[*Field Experiments: Design, Analysis, and
Interpretation*](https://doi.org/10.60600/YU/VUH8KD), on Yale Dataverse.
`data-raw/` holds one build script per group of datasets; each names the archive
file it reads by its numeric id, so any dataset can be traced back to a citable
file:

```r
source("data-raw/build_all.R")   # refetch and rebuild every .rda
source("data-raw/verify.R")      # check each rebuild against what is shipped
```

The two exceptions are Tables 12.2 and 12.5, which are new in this edition and
authored in the manuscript rather than drawn from the archive; their values are
written out in `data-raw/book_tables.R`. The hotspot coordinates behind Table
8.4 are a third case: they are not in the archive as data, but the archive's own
Chapter 8 code draws them from `set.seed(1337)`, so the build regenerates them
exactly.

## Related

Regression adjustment helpers that used to live here now live in
[estimatrTools](https://github.com/acoppock/estimatrTools); see
`NOTES_moved_to_estimatrTools.md`.

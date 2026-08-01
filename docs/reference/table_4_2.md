# Table 4.2 from FEDAI

The teacher incentives experiment of Table 4.1 under block random
assignment. Assignment probabilities differ across blocks, so the design
needs weights.

## Usage

``` r
table_4_2
```

## Format

A data frame with 40 rows and 9 columns:

- observation:

  Subject number, matching Table 4.1

- block:

  Block, one of three religious-composition strata

- X_pretest:

  Pretest score, strongly predictive of the outcome

- X_pretest_weak:

  Pretest score, weakly predictive of the outcome

- Z:

  Realized treatment assignment under blocking

- prob:

  Probability of assignment to treatment in this subject's block

- wt:

  Inverse-probability weight

- Y_Z_0:

  Untreated potential outcome

- Y_Z_1:

  Treated potential outcome

## Source

ISPS Data Archive study D081
[doi:10.60600/YU/VUH8KD](https://doi.org/10.60600/YU/VUH8KD) , file
42335 (`GerberGreenBook_Chapter4_Combined_Table_4_1_4_2`). Built by
`data-raw/book_tables.R`.

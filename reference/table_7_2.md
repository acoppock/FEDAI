# Table 7.2 from FEDAI

Complete set of potential outcomes and covariates for eight subjects,
adding a binary covariate to the reporting schedule of Table 7.1.

## Usage

``` r
table_7_2
```

## Format

A data frame with 8 rows and 8 columns:

- observation:

  Subject number, 1 to 8

- X:

  Binary pre-treatment covariate

- R_Z_0:

  Reports if assigned to control

- R_Z_1:

  Reports if assigned to treatment

- Y_Z_0:

  Untreated potential outcome, latent

- Y_Z_1:

  Treated potential outcome, latent

- Y_Z_0_R_Z_0:

  Outcome observed under control, `NA` when unreported

- Y_Z_1_R_Z_1:

  Outcome observed under treatment, `NA` when unreported

## Source

ISPS Data Archive study D081
[doi:10.60600/YU/VUH8KD](https://doi.org/10.60600/YU/VUH8KD) , file
42286 (`GerberGreenBook_Chapter7_Table_7_2`). Built by
`data-raw/book_tables.R`.

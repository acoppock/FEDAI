# Table 2.1 from FEDAI

This hypothetical dataset shows the treated (`Y_Z_1`) and untreated
(`Y_Z_0`) potential outcomes for all seven villages, as well as a column
for their difference, the village-level treatment effect `tau_i`.

## Usage

``` r
table_2_1
```

## Format

A data frame with 7 rows and 4 columns:

- Village:

  Village number, 1 to 7

- Y_Z_0:

  Untreated potential outcome

- Y_Z_1:

  Treated potential outcome

- tau_i:

  Village-level treatment effect, `Y_Z_1 - Y_Z_0`

## Source

ISPS Data Archive study D081
[doi:10.60600/YU/VUH8KD](https://doi.org/10.60600/YU/VUH8KD) , file
42291 (`GerberGreenBook_Chapter2_Table_2_1`). Built by
`data-raw/book_tables.R`.

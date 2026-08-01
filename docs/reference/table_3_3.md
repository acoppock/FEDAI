# Table 3.3 from FEDAI

This hypothetical dataset has the treated (`Y_Z_1`) and untreated
(`Y_Z_0`) potential outcomes for 14 villages in two blocks.

## Usage

``` r
table_3_3
```

## Format

A data frame with 14 rows and 4 columns:

- Village:

  Village number, 1 to 14

- Block:

  Block, 1 or 2

- Y_Z_0:

  Untreated potential outcome

- Y_Z_1:

  Treated potential outcome

## Source

ISPS Data Archive study D081
[doi:10.60600/YU/VUH8KD](https://doi.org/10.60600/YU/VUH8KD) , file
42294 (`GerberGreenBook_Chapter3_Table_3_3`). Built by
`data-raw/book_tables.R`.

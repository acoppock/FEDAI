# Table 3.4 from FEDAI

Hypothetical schedule of potential outcomes for 14 villages under
noncompliance. `D` and `Y` are character columns because the table
prints `"."` for the potential outcome that assignment did not reveal.

## Usage

``` r
table_3_4
```

## Format

A data frame with 14 rows and 4 columns:

- Village:

  Village number, 1 to 14

- Block:

  Block, 1 or 2

- D:

  Treated potential outcome, `"."` where unrevealed

- Y:

  Untreated potential outcome, `"."` where unrevealed

## Source

ISPS Data Archive study D081
[doi:10.60600/YU/VUH8KD](https://doi.org/10.60600/YU/VUH8KD) , file
42353 (`GerberGreenBook_Chapter3_Table_3_4`). Built by
`data-raw/book_tables.R`.

# Table 7.7 from FEDAI

Hypothetical paired potential outcomes with attrition for four subjects.

## Usage

``` r
table_7_7
```

## Format

A data frame with 4 rows and 8 columns:

- observation:

  Subject number, 1 to 4

- Pair:

  Matched pair, A or B

- R_Z_0:

  Reports if assigned to control, 1 for everyone

- R_Z_1:

  Reports if assigned to treatment

- Y_Z_0:

  Untreated potential outcome

- Y_Z_1:

  Treated potential outcome

- Y_Z_0_R_Z_0:

  Outcome observed under control

- Y_Z_1_R_Z_1:

  Outcome observed under treatment, the character string `"Missing"` for
  the subject who attrites. The column is character rather than numeric
  because the book's table prints the word

## Source

ISPS Data Archive study D081
[doi:10.60600/YU/VUH8KD](https://doi.org/10.60600/YU/VUH8KD) , file
42265 (`GerberGreenBook_Chapter7_Table_7_7`). Built by
`data-raw/book_tables.R`.

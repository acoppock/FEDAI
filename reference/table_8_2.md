# Table 8.2 from FEDAI

Hypothetical potential outcomes for five villages depending on their own
treatment status (`Z`) and that of an adjacent village (`A`).

## Usage

``` r
table_8_2
```

## Format

A data frame with 5 rows and 4 columns:

- observation:

  Village number, 1 to 5

- Y_A_0_Z_0:

  Outcome when neither the village nor its neighbor is treated

- Y_A_1_Z_0:

  Outcome when the neighbor is treated and the village is not, the
  spillover condition. `NA` for the village with no neighbor

- Y_A_0_Z_1:

  Outcome when the village is treated and the neighbor is not

## Source

ISPS Data Archive study D081
[doi:10.60600/YU/VUH8KD](https://doi.org/10.60600/YU/VUH8KD) , file
42380 (`GerberGreenBook_Chapter8_Table_8_2`). Built by
`data-raw/book_tables.R`.

# Table 8.7 from FEDAI

Hypothetical potential outcomes for eight media markets over three
periods, depending on current and previous period treatment status.
Treatment is sticky, so the twice-treated potential outcome does not
exist in period 1.

## Usage

``` r
table_8_7
```

## Format

A data frame with 24 rows and 8 columns:

- market:

  Market number, 1 to 8

- period:

  Period, `"1"` to `"3"`

- prob_P_0_C_0:

  Probability of being untreated in both the previous and the current
  period

- prob_P_0_C_1:

  Probability of being newly treated this period

- prob_P_1_C_1:

  Probability of having been treated in both periods

- Y_P_0_C_0:

  Outcome when untreated in both periods

- Y_P_0_C_1:

  Outcome when newly treated

- Y_P_1_C_1:

  Outcome when treated in both periods, `NA` in period 1

## Source

ISPS Data Archive study D081
[doi:10.60600/YU/VUH8KD](https://doi.org/10.60600/YU/VUH8KD) , file
42359 (`GerberGreenBook_Chapter8_Table_8_7`). Built by
`data-raw/book_tables.R`.

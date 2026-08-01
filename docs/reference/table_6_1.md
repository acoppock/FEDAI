# Table 6.1 from FEDAI

Hypothetical schedule of potential outcomes assuming two-sided
noncompliance, so all four compliance types are present, defiers
included.

## Usage

``` r
table_6_1
```

## Format

A data frame with 10 rows and 8 columns:

- observation:

  Subject number, 1 to 10

- type:

  Compliance type: Complier, Defier, Always-Taker or Never-Taker

- D_Z_0:

  Treatment received if assigned to control

- D_Z_1:

  Treatment received if assigned to treatment

- Y_D_0:

  Outcome if untreated

- Y_D_1:

  Outcome if treated

- Y_Z_0:

  Outcome if assigned to control

- Y_Z_1:

  Outcome if assigned to treatment

## Source

ISPS Data Archive study D081
[doi:10.60600/YU/VUH8KD](https://doi.org/10.60600/YU/VUH8KD) , file
42280 (`GerberGreenBook_Chapter6_Table_6_1`). Built by
`data-raw/book_tables.R`.

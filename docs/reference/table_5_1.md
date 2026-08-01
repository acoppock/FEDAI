# Table 5.1 from FEDAI

Hypothetical schedule of potential outcomes assuming one-sided
noncompliance: no one assigned to control can take the treatment, so
there are no always-takers and no defiers.

## Usage

``` r
table_5_1
```

## Format

A data frame with 9 rows and 6 columns:

- observation:

  Subject number, 1 to 9

- type:

  Compliance type, Complier or Never-Taker

- D_Z_0:

  Treatment received if assigned to control, 0 for everyone

- D_Z_1:

  Treatment received if assigned to treatment

- Y_D_0:

  Outcome if untreated

- Y_D_1:

  Outcome if treated

## Source

ISPS Data Archive study D081
[doi:10.60600/YU/VUH8KD](https://doi.org/10.60600/YU/VUH8KD) , file
42330 (`GerberGreenBook_Chapter5_Table_5_1`). Built by
`data-raw/book_tables.R`.

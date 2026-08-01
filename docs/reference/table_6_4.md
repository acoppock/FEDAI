# Table 6.4 from FEDAI

Hypothetical schedule of potential outcomes and assigned treatments for
the illustration of a downstream experiment.

## Usage

``` r
table_6_4
```

## Format

A data frame with 32 rows and 8 columns:

- observation:

  Subject number, 1 to 32

- subject_type:

  Compliance type: always-takers, compliers, defiers or never-takers

- Z:

  Realized treatment assignment

- wt:

  Number of subjects of this type, used as a frequency weight

- D_Z_0:

  Treatment received if assigned to control

- D_Z_1:

  Treatment received if assigned to treatment

- Y_D_0:

  Outcome if untreated

- Y_D_1:

  Outcome if treated

## Source

ISPS Data Archive study D081
[doi:10.60600/YU/VUH8KD](https://doi.org/10.60600/YU/VUH8KD) , file
42309 (`GerberGreenBook_Chapter6_Table_6_4`). Built by
`data-raw/book_tables.R`.

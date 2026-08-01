# Table 10.1 from FEDAI

Hypothetical potential outcomes for six kinds of subjects, used to show
why regressing the outcome on a post-treatment mediator does not recover
the effect that runs through it.

## Usage

``` r
table_10_1
```

## Format

A data frame with 6 rows and 10 columns:

- population_share:

  Share of the population of this subject type, 1/6 throughout

- Z:

  Realized treatment assignment

- M_Z_0:

  Mediator if untreated

- M_Z_1:

  Mediator if treated

- M:

  Revealed mediator

- Y_Z_0:

  Untreated potential outcome

- Y_Z_1:

  Treated potential outcome

- Y:

  Revealed outcome

- e1:

  Disturbance in the mediator equation

- e3:

  Disturbance in the outcome equation

## Source

ISPS Data Archive study D081
[doi:10.60600/YU/VUH8KD](https://doi.org/10.60600/YU/VUH8KD) , file
42270 (`GerberGreenBook_Chapter10_Table_10_1`). Built by
`data-raw/book_tables.R`.

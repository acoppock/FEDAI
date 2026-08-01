# Table 2.2 from FEDAI

This hypothetical dataset shows a realized assignment (`Z`) and the
corresponding revealed outcome (`Y`). Unobserved treated (`Y_Z_1`) and
untreated (`Y_Z_0`) potential outcomes are marked as `NA`, as is the
village-level treatment effect `tau_i`.

## Usage

``` r
table_2_2
```

## Format

A data frame with 7 rows and 6 columns:

- Village:

  Village number, 1 to 7

- Z:

  Realized treatment assignment, 1 for the two treated villages

- Y_Z_0:

  Untreated potential outcome, `NA` where treatment was assigned

- Y_Z_1:

  Treated potential outcome, `NA` where control was assigned

- Y:

  Revealed outcome

- tau_i:

  Village-level treatment effect, `NA` throughout: it is never
  observable

## Source

Derived from Table 2.1 (file 42291) by applying the assignment printed
in the book. Built by `data-raw/book_tables.R`.

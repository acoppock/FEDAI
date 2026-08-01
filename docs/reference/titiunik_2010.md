# Titiunik (2010) legislative term length experiment

Exercise dataset for Chapter 13. Texas and Arkansas assign newly elected
state senators to two-year or four-year terms by lottery, which makes
term length experimentally manipulated rather than chosen.

## Usage

``` r
titiunik_2010
```

## Format

A data frame with 124 rows and 6 columns:

- year:

  Legislative session. The 1993 sessions are coded 19931 and 19932, so
  the column has four distinct values rather than three

- party:

  Senator's party, `"Dem."` or `"Rep."`

- dshort_term:

  Assigned term length, `"2 years"` or `"4 years"`

- votesh_incumb:

  Incumbent vote share

- usrepvotesh_dem:

  Democratic vote share for US Representative in the district

- bills_intro:

  Bills introduced by the senator

## Source

Titiunik, R. (2010). Drawing Your Senator from a Jar: Term Length and
Legislative Behavior. Working paper. ISPS Data Archive study D081
[doi:10.60600/YU/VUH8KD](https://doi.org/10.60600/YU/VUH8KD) , file
42333 (`Titiunik_WorkingPaper_2010`). Built by
`data-raw/exercise_datasets.R`.

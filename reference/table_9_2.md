# Table 9.2 from FEDAI

Aggregate reply rates from Rosen (2010), stratified by whether the
legislator is Hispanic. The moderator is a pre-treatment characteristic
of the legislator, not of the letter.

## Usage

``` r
table_9_2
```

## Format

A data frame with 8 rows and 5 columns:

- X_legislator_hispanic:

  Whether the recipient legislator is Hispanic

- Z_author:

  Apparent ethnicity of the letter writer

- Z_good_grammar:

  Whether the letter used good grammar

- Y_reply_pct:

  Percent of legislators who replied

- N:

  Letters sent in this cell

## Source

ISPS Data Archive study D081
[doi:10.60600/YU/VUH8KD](https://doi.org/10.60600/YU/VUH8KD) , file
42308 (`GerberGreenBook_Chapter9_Table_9_2`). Built by
`data-raw/book_tables.R`.

# Box 3.7 from FEDAI

This hypothetical dataset has two columns, a realized treatment (`Z`)
and a revealed outcome (`Y`). The purpose of the dataset is to
illustrate how traditional t-tests and randomization inference can yield
different answers.

## Usage

``` r
box_3_7
```

## Format

A data frame with 20 rows and 2 columns:

- Z:

  Realized treatment assignment

- Y:

  Revealed outcome, a donation amount. The distribution is skewed: most
  donations are small and one is 500, which is what pulls the t-test and
  randomization inference apart

## Source

ISPS Data Archive study D081
[doi:10.60600/YU/VUH8KD](https://doi.org/10.60600/YU/VUH8KD) , file
42300 (`GerberGreenBook_Chapter3_Donations`). Built by
`data-raw/book_tables.R`.

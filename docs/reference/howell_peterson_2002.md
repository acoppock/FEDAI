# Howell and Peterson (2002) school voucher experiment

Exercise dataset for Chapter 12, Exercise 12.11. Lottery-allocated
private school vouchers in New York City, used as an exercise on
attrition: the missingness indicator is the point of the dataset.

## Usage

``` r
howell_peterson_2002
```

## Format

A data frame with 1,851 rows and 4 columns:

- treat:

  Offered a voucher by lottery

- missing_y1math:

  Year-one math score is missing

- y0_1math_change:

  Change in math score from baseline, missing for 396 subjects

- subset_desc:

  Subset indicator, 1 for every row in this extract

## Source

Howell, W. G. and Peterson, P. E. (2002). The Education Gap: Vouchers
and Urban Schools. Brookings Institution Press. ISPS Data Archive study
D081 [doi:10.60600/YU/VUH8KD](https://doi.org/10.60600/YU/VUH8KD) , file
42361 (`Howell_Peterson_BIP_2002`). Built by
`data-raw/exercise_datasets.R`.

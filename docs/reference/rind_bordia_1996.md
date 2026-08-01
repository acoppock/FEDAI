# Rind and Bordia (1996) restaurant tipping experiment

Exercise dataset for Chapter 9, Exercise 9.6. Servers randomly drew a
smiley face on the check or did not; the design crosses that with server
sex.

## Usage

``` r
rind_bordia_1996
```

## Format

A data frame with 89 rows and 5 columns:

- female:

  Server is female

- happyface:

  Smiley face drawn on the check

- tip:

  Tip as a percentage of the bill

- xhappy:

  Interaction of `female` and `happyface`

- tipround:

  Tip rounded to the nearest whole number

## Source

Rind, B. and Bordia, P. (1996). Effect on Restaurant Tipping of Male and
Female Servers Drawing a Happy, Smiling Face on the Backs of Customers'
Checks. Journal of Applied Social Psychology, 26(3), 218-225. ISPS Data
Archive study D081
[doi:10.60600/YU/VUH8KD](https://doi.org/10.60600/YU/VUH8KD) , file
42341 (`Rind_Bordia_JASP_1996`). Built by
`data-raw/exercise_datasets.R`.

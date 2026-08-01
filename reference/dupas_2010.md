# Dupas (2010) bed net pricing experiment

Exercise dataset for Chapter 11, Exercises 11.8 and 11.9. Randomly
assigned subsidy levels for insecticide-treated bed nets in Kenya.

## Usage

``` r
dupas_2010
```

## Format

A data frame with 1,120 rows and 3 columns:

- cfw_id:

  Community health worker identifier, 1 to 6

- price:

  Randomly assigned price in Kenyan shillings, 0 to 250, 17 distinct
  values

- purchasednet:

  Whether a net was purchased, `"yes"` or `"no"`. The column is
  character rather than an indicator

## Source

Dupas, P. (2010). Short-Run Subsidies and Long-Run Adoption of New
Health Products: Evidence from a Field Experiment. Working paper. ISPS
Data Archive study D081
[doi:10.60600/YU/VUH8KD](https://doi.org/10.60600/YU/VUH8KD) , file
42278 (`Chapter_11_Dupas_2010_Dataset`). Built by
`data-raw/exercise_datasets.R`.

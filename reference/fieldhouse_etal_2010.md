# Fieldhouse et al. (2010) UK mobilization experiment

Exercise dataset for Chapter 9, Exercise 9.9. Factorial voter
mobilization experiment crossing mail with other forms of contact.

## Usage

``` r
fieldhouse_etal_2010
```

## Format

A data frame with 15,300 rows and 6 columns:

- m:

  Assigned to the mail treatment

- p:

  Assigned to the phone treatment

- c:

  Assigned to the canvassing treatment

- y:

  Voted

- p_m:

  Interaction of `p` and `m`

- c_m:

  Interaction of `c` and `m`

## Source

Fieldhouse, E., Cutts, D., Widdop, P. and John, P. (2010). ISPS Data
Archive study D081
[doi:10.60600/YU/VUH8KD](https://doi.org/10.60600/YU/VUH8KD) , file
42348 (`Fieldhouse_et_al_unpublished_2010_expanded`). Built by
`data-raw/exercise_datasets.R`.

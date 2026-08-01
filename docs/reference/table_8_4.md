# Table 8.4 from FEDAI

Hypothetical potential outcomes for 30 policing hotspots, depending on
their own treatment status (`Z`) and on whether a nearby hotspot is
treated (`A`). Because exposure to spillover is itself random, each
hotspot has a probability of landing in each of the four exposure
conditions.

## Usage

``` r
table_8_4
```

## Format

A data frame with 30 rows and 17 columns:

- hotspot:

  Hotspot number, 1 to 30

- x, y:

  Coordinates in the plane

- hotspots_within_500m:

  Number of other hotspots within 500m

- hotspots_within_750m:

  Number of other hotspots within 750m

- A:

  Realized spillover exposure, `"0"` or `"1"`

- Z:

  Realized direct treatment, `"0"` or `"1"`

- exposure:

  Two-character exposure condition, `A` followed by `Z`

- prob_A_0_Z_0, prob_A_0_Z_1, prob_A_1_Z_0, prob_A_1_Z_1:

  Probability of each exposure condition under the randomization

- Y_A_0_Z_0, Y_A_0_Z_1, Y_A_1_Z_0, Y_A_1_Z_1:

  Potential outcome in each exposure condition

- Y:

  Revealed outcome

## Source

ISPS Data Archive study D081
[doi:10.60600/YU/VUH8KD](https://doi.org/10.60600/YU/VUH8KD) , file
42273 (`GerberGreenBook_Chapter8_Table_8_4_8_5`). The coordinates are
not stored in the archive as data; they are regenerated from the
`set.seed(1337)` draw in the archive's own Chapter 8 figure code (file
42377). Built by `data-raw/book_tables.R`.

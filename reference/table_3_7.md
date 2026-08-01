# Table 3.7 from FEDAI

Hypothetical potential outcomes for 12 classrooms in 4 schools, in the
case where cluster means barely vary across schools. The individual
outcomes are the same ones as in Table 3.6; only their assignment to
schools differs, which is what makes the pair a demonstration that what
matters is how much cluster means differ, not how many clusters there
are.

## Usage

``` r
table_3_7
```

## Format

A data frame with 12 rows and 6 columns:

- school:

  School, A to D

- classroom:

  Classroom within school, e.g. `"A-1"`

- Y_Z_0:

  Untreated potential outcome

- Y_Z_1:

  Treated potential outcome

- Y_cluster_mean_Z_0:

  School mean of `Y_Z_0`

- Y_cluster_mean_Z_1:

  School mean of `Y_Z_1`

## Source

ISPS Data Archive study D081
[doi:10.60600/YU/VUH8KD](https://doi.org/10.60600/YU/VUH8KD) , file
42370 (`GerberGreenBook_Chapter3_Table_3_7`). Built by
`data-raw/book_tables.R`.

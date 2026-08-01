# Table 3.6 from FEDAI

Hypothetical potential outcomes for 12 classrooms in 4 schools, in the
case where cluster means vary a lot across schools. Paired with Table
3.7, which holds the individual outcomes fixed and varies only how they
are grouped.

## Usage

``` r
table_3_6
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
42283 (`GerberGreenBook_Chapter3_Table_3_6`). Built by
`data-raw/book_tables.R`.

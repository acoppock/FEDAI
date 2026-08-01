# Distance matrix for Table 8.4 from FEDAI

Euclidean distances between the 30 policing hotspots of `table_8_4`,
which determine which hotspots are exposed to a treated neighbor.

## Usage

``` r
table_8_4_distmat
```

## Format

A 30 by 30 numeric matrix. Row and column `i` correspond to
`table_8_4$hotspot == i`, and the diagonal is zero.

## Source

Computed from the hotspot coordinates described under `table_8_4`. Built
by `data-raw/book_tables.R`.

# Table 12.2 from FEDAI

Strata for an oversampling illustration built on the Slemrod, Blumenthal
and Christian (2001) tax compliance experiment. Six strata are defined
by income level and self-reported opportunity to underreport. The
smallest stratum has the largest effect, which is the case for
oversampling it.

## Usage

``` r
table_12_2
```

## Format

A data frame with 6 rows and 4 columns:

- income:

  Income level: low, medium or high

- opportunity:

  Opportunity to underreport: low or high

- N_pop:

  Population size of the stratum

- effect:

  Stipulated true ATE within the stratum, in percentage points of
  reported income

## Source

Authored for this edition rather than taken from the archive. The
stratum sizes come from the Minnesota tax compliance experiment; the
effects are stipulated. Built by `data-raw/book_tables.R`.

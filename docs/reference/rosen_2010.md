# Rosen (2010) legislator audit experiment

400 letters sent to state legislators in a 2x2 factorial experiment
varying the apparent ethnicity of the writer and the quality of the
grammar. Used in Chapter 9 as the running example of factorial designs
and moderators.

## Usage

``` r
rosen_2010
```

## Format

A data frame with 400 rows and 7 columns:

- observation:

  Letter number, 1 to 400

- letter_name:

  Name signed on the letter, Colin or Jose

- X_legislator_hispanic:

  Recipient legislator is Hispanic

- Z_hispanic:

  Letter signed with the Hispanic name

- Z_grammar_label:

  Grammar quality, good or bad

- Z_good_grammar:

  Letter used good grammar

- Y_response:

  Legislator replied

## Source

Rosen, J. (2010). The Effects of Race and Grammar Quality on the
Responsiveness of American State Legislators: A Field Experiment.
Unpublished manuscript. ISPS Data Archive study D081
[doi:10.60600/YU/VUH8KD](https://doi.org/10.60600/YU/VUH8KD) , file
42255 (`GerberGreebBook_Chapter9_Rosen`). Built by `data-raw/studies.R`.

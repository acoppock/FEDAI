# Simulate a research literature with a gender-composition moderator

Generates multiple simulated research literatures in which the true ATE
in each study equals `0.1 * proportion_women`, where `proportion_women`
ranges uniformly from -0.5 to 0.5 across `N_studies` studies. Each
"literature" is a random ordering of those studies, allowing the
cumulative meta-regression estimate to be traced as evidence
accumulates. Used in Chapter 11 to illustrate how the path of knowledge
accumulation affects how quickly a moderating relationship is recovered.

## Usage

``` r
make_studies(N, N_studies, N_literatures)
```

## Arguments

- N:

  Integer. Sample size for each individual study.

- N_studies:

  Integer. Number of studies in the literature.

- N_literatures:

  Integer. Number of random orderings (literature histories) to
  generate.

## Value

A tibble of simulation results from
[`DeclareDesign::simulate_designs()`](https://declaredesign.org/r/declaredesign/reference/simulate_design.html),
with an added `study` column giving each study's position in its
literature's random ordering.

## Details

Requires the `DeclareDesign` package.

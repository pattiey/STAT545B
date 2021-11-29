
<!-- README.md is generated from README.Rmd. Please edit that file -->

# STAT545B

<!-- badges: start -->
<!-- badges: end -->

STAT545B contains the functions created for STAT545B 2021W1. The main
function present in this package is `group_counts()` which returns the
counts of specified group(s) within a tibble, sorted in decreasing order
of count.

## Installation

You can install the development version of STAT545B from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("pattiey/STAT545B")
```

## Example

This is a basic example which shows you how to use the `group_counts`
function in the `STAT545B` package:

``` r
library(STAT545B)
## basic example code
group_counts(tibble::as_tibble(iris), Species)
#> # A tibble: 3 × 2
#>   Species    count
#>   <fct>      <int>
#> 1 setosa        50
#> 2 versicolor    50
#> 3 virginica     50
```

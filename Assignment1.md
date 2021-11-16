
First load all required libraries.

``` r
library(tidyverse)
library(datateachr)
library(gapminder)
library(testthat)
```

# Exercise 1: Make a Function

I will make a function that would have been useful in the mini-data
analysis. This function takes a tibble and any number of variables as
input, then returns the counts for each group in the specified
variables, sorted in descending order.

``` r
#' Count by group(s)

#' This function returns the counts of specified group(s) within a tibble, 
#' sorted in decreasing order of count
#' 
#' @param data A tibble of interest the contains the data to pull counts from
#' @param ... A list of variables present in the tibble to group-by. When not present, returns the total count in the tibble
#' @return A tibble containing the summarized counts for each group in the variable(s) specified, sorted in decreasing order of count

group_counts <- function(data, ...) {
  stopifnot(is_tibble(data))
  data %>% 
    group_by(...) %>% 
    summarise(count = n()) %>% 
    arrange(desc(count))
}
```

# Exercise 3: Include examples

Show an example to group tree counts by neighbourhood using the
`vancouver_trees` dataset from `datateachr`

``` r
group_counts(vancouver_trees, neighbourhood_name)
```

    ## # A tibble: 22 × 2
    ##    neighbourhood_name       count
    ##    <chr>                    <int>
    ##  1 RENFREW-COLLINGWOOD      11386
    ##  2 KENSINGTON-CEDAR COTTAGE 11042
    ##  3 HASTINGS-SUNRISE         10547
    ##  4 DUNBAR-SOUTHLANDS         9415
    ##  5 SUNSET                    8367
    ##  6 KITSILANO                 8115
    ##  7 VICTORIA-FRASERVIEW       7789
    ##  8 SHAUGHNESSY               7009
    ##  9 KERRISDALE                6936
    ## 10 RILEY PARK                6870
    ## # … with 12 more rows

Function can also be used with pipe function

``` r
vancouver_trees %>% group_counts(neighbourhood_name)
```

    ## # A tibble: 22 × 2
    ##    neighbourhood_name       count
    ##    <chr>                    <int>
    ##  1 RENFREW-COLLINGWOOD      11386
    ##  2 KENSINGTON-CEDAR COTTAGE 11042
    ##  3 HASTINGS-SUNRISE         10547
    ##  4 DUNBAR-SOUTHLANDS         9415
    ##  5 SUNSET                    8367
    ##  6 KITSILANO                 8115
    ##  7 VICTORIA-FRASERVIEW       7789
    ##  8 SHAUGHNESSY               7009
    ##  9 KERRISDALE                6936
    ## 10 RILEY PARK                6870
    ## # … with 12 more rows

An example grouping by multiple variables in the `vancouver_trees`
dataset

``` r
group_counts(vancouver_trees, neighbourhood_name, curb, height_range_id)
```

    ## `summarise()` has grouped output by 'neighbourhood_name', 'curb'. You can override using the `.groups` argument.

    ## # A tibble: 402 × 4
    ## # Groups:   neighbourhood_name, curb [44]
    ##    neighbourhood_name       curb  height_range_id count
    ##    <chr>                    <chr>           <dbl> <int>
    ##  1 RENFREW-COLLINGWOOD      Y                   1  3781
    ##  2 KENSINGTON-CEDAR COTTAGE Y                   2  3034
    ##  3 RENFREW-COLLINGWOOD      Y                   2  2960
    ##  4 HASTINGS-SUNRISE         Y                   1  2862
    ##  5 HASTINGS-SUNRISE         Y                   2  2676
    ##  6 VICTORIA-FRASERVIEW      Y                   2  2474
    ##  7 KENSINGTON-CEDAR COTTAGE Y                   1  2464
    ##  8 SUNSET                   Y                   2  2453
    ##  9 SUNSET                   Y                   1  2251
    ## 10 VICTORIA-FRASERVIEW      Y                   1  2101
    ## # … with 392 more rows

The function only works with tibbles, here is an example of it failing
when a non-tibble is inputted, and then working with the same dataset as
a tibble

``` r
group_counts(iris, Species)
```

    ## Error in group_counts(iris, Species): is_tibble(data) is not TRUE

``` r
group_counts(as_tibble(iris), Species)
```

    ## # A tibble: 3 × 2
    ##   Species    count
    ##   <fct>      <int>
    ## 1 setosa        50
    ## 2 versicolor    50
    ## 3 virginica     50

# Exercise 4: Test the function

Test for the scenarios:

-   `data` is a tibble, no variables to group-by (return the total count
    of the tibble)
-   `data` is a tibble, one variable to group-by that is present in the
    tibble
-   `data` is a tibble, multiple variables to group-by that are present
    in the tibble
-   `data` is a tibble, variable to group-by is not present in the
    tibble
-   `data` is a dataframe, function should throw an error
-   `data` is not a tibble, function should throw an error

``` r
test_that("group_counts function works", {
  expect_equal(dim(group_counts(gapminder)), c(1,1))
  expect_equal(dim(group_counts(gapminder, continent)), c(5,2))
  expect_equal(dim(group_counts(gapminder, continent, year)), c(60,3))
  expect_error(group_counts(gapminder, some_wrong_var))
  expect_error(group_counts(iris, Species))
  expect_error(group_counts(123))
})
```

    ## Test passed 😸

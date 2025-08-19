
# forested <a href="https://simonpcouch.github.io/forested/"><img src="man/figures/logo.png" align="right" height="277" alt="forested website" /></a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/simonpcouch/forested/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/simonpcouch/forested/actions/workflows/R-CMD-check.yaml)
[![CRAN
status](https://www.r-pkg.org/badges/version/forested)](https://CRAN.R-project.org/package=forested)
<!-- badges: end -->

## Data on Forest Attributes in U.S. States

The U.S. Department of Agriculture, Forest Service, Forest Inventory and
Analysis (FIA) Program provides all sorts of estimates of forest
attributes for uses in research, legislation, and land management. The
FIA uses a set of criteria to classify a plot of land as “forested” or
“non-forested,” and that classification is a central data point in many
decision-making contexts. A small subset of plots in country are sampled
and assessed “on-the-ground” as forested or non-forested, but the FIA
has access to remotely sensed data for all land in the country.
**forested is an R data package** containing state-by-state data frames
with which we can develop models on the more easily-accessible remotely
sensed data to predict whether a plot is forested or non-forested.

## Installation

Install the most recent release of forested from CRAN with:

``` r
install.packages("forested")
```

Install the development version of forested from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("simonpcouch/forested")
```

## Example

``` r
library(tibble)
library(forested)

forested
#> # A tibble: 7,107 × 20
#>    forested  year elevation eastness northness roughness tree_no_tree dew_temp
#>    <fct>    <dbl>     <dbl>    <dbl>     <dbl>     <dbl> <fct>           <dbl>
#>  1 Yes       2005       881       90        43        63 Tree             0.04
#>  2 Yes       2005       113      -25        96        30 Tree             6.4 
#>  3 No        2005       164      -84        53        13 Tree             6.06
#>  4 Yes       2005       299       93        34         6 No tree          4.43
#>  5 Yes       2005       806       47       -88        35 Tree             1.06
#>  6 Yes       2005       736      -27       -96        53 Tree             1.35
#>  7 Yes       2005       636      -48        87         3 No tree          1.42
#>  8 Yes       2005       224      -65       -75         9 Tree             6.39
#>  9 Yes       2005        52      -62        78        42 Tree             6.5 
#> 10 Yes       2005      2240      -67       -74        99 No tree         -5.63
#> # ℹ 7,097 more rows
#> # ℹ 12 more variables: precip_annual <dbl>, temp_annual_mean <dbl>,
#> #   temp_annual_min <dbl>, temp_annual_max <dbl>, temp_january_min <dbl>,
#> #   vapor_min <dbl>, vapor_max <dbl>, canopy_cover <dbl>, lon <dbl>, lat <dbl>,
#> #   land_type <fct>, county <fct>
```

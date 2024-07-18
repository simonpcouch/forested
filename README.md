
# forested: Data on Forest Attributes in Washington State

The U.S. Department of Agriculture, Forest Service, Forest Inventory and
Analysis (FIA) Program provides all sorts of estimates of forest
attributes for uses in research, legislation, and land management. The
FIA uses a set of criteria to classify a plot of land as “forested” or
“non-forested,” and that classification is a central data point in many
decision-making contexts. A small subset of plots in Washington State
are sampled and assessed “on-the-ground” as forested or non-forested,
but the FIA has access to remotely sensed data for all land in the
state. **forested is an R data package** containing a data frame,
`forested`, from which we can develop a model on the more
easily-accessible remotely sensed data to predict whether a plot is
forested or non-forested.

## Installation

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
#> # A tibble: 7,109 × 19
#>    forested  year elevation eastness northness roughness tree_no_tree dew_temp
#>    <fct>    <dbl>     <dbl>    <dbl>     <dbl>     <dbl> <fct>           <dbl>
#>  1 Yes       2005       881       90        43        63 No                  4
#>  2 Yes       2005       113      -25        96        30 No                640
#>  3 No        2005       164      -84        53        13 No                606
#>  4 Yes       2005       299       93        34         6 Yes               443
#>  5 Yes       2005       806       47       -88        35 No                106
#>  6 Yes       2005       736      -27       -96        53 No                135
#>  7 Yes       2005       636      -48        87         3 Yes               142
#>  8 Yes       2005       224      -65       -75         9 No                639
#>  9 Yes       2005        52      -62        78        42 No                650
#> 10 Yes       2005      2240      -67       -74        99 Yes              -563
#> # ℹ 7,099 more rows
#> # ℹ 11 more variables: annual_precip <dbl>, annual_mean_temp <dbl>,
#> #   annual_min_temp <dbl>, annual_max_temp <dbl>, january_min_temp <dbl>,
#> #   min_vapor <dbl>, max_vapor <dbl>, canopy_cover <dbl>, lon <dbl>, lat <dbl>,
#> #   worldcover <fct>
```

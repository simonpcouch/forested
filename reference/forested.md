# Forest Attributes in the U.S.

The U.S. Department of Agriculture, Forest Service, Forest Inventory and
Analysis (FIA) Program provides all sorts of estimates of forest
attributes for uses in research, legislation, and land management. The
FIA uses a set of criteria to classify a plot of land as "forested" or
"non-forested," and that classification is a central data point in many
decision-making contexts. A small subset of plots in the U.S. are
sampled and assessed "on-the-ground" as forested or non-forested, but
the FIA has access to remotely sensed data for all land in the country.
Practitioners can develop a model on the more easily-accessible remotely
sensed data to predict whether a plot is forested or non-forested.

## Usage

``` r
forested

forested_wa

forested_ga
```

## Format

A data frame with:

- forested:

  Whether the plot is classified as "forested" or not, as a factor with
  levels `"Yes"` and `"No"`.

- year:

  Year when the plot was classified "on-the-ground" as forested or not.
  The remaining, remotely-sensed variables are measured at different
  times or averaged over multiple years.

- elevation:

  Elevation, in meters.

- eastness:

  Transformed aspect degrees to eastness (-100 to 100).

- northness:

  Transformed aspect degrees to northness (-100 to 100).

- roughness:

  Degree of irregularity of the plot.

- tree_no_tree:

  LANDFIRE tree/non-tree lifeform mask, as a factor with levels `"Tree"`
  and `"No tree"`.

- dew_temp:

  Mean annual dewpoint temperature (1991-2020), in degrees Celsius.

- precip_annual:

  Mean annual precipitation (1991-2020), in mm × 100.

- temp_annual_mean:

  Mean annual temperature (1991-2020), in degrees Celsius.

- temp_annual_min:

  Mean annual minimum temperature (1991-2020), in degrees Celsius.

- temp_annual_max:

  Mean annual maximum temperature (1991-2020), in degrees Celsius.

- temp_january_min:

  Mean minimum temperature in January (1991-2020), in degrees Celsius.

- vapor_min, vapor_max:

  Minimum and maximum annual vapor pressure deficit (1991-2020), in Pa x
  100.

- canopy_cover:

  Analytical Tree Canopy Cover, as a percent.

- lon, lat:

  The longitude and latitude of the center of the plot with a slight
  perturbation.

- land_type:

  Land cover type from European Space Agency (ESA) 2020 WorldCover
  global land cover product, as a factor with levels `"Tree"`,
  `"Non-tree vegetation"`, and `"Barren"`.

- county:

  The county in the state, as a factor.

The number of rows varies by state. Washington has 7107 rows, Georgia
has 10937.

The Georgia data has one less column than the Washington data as its
`northness` column has been omitted due to issues with the source
raster.

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
7107 rows and 20 columns.

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
10937 rows and 19 columns.

## Source

*For more information on the source data, see Table 1 in:*

White, Grayson W.; Yamamoto, Josh K.; Elsyad, Dinan H.; Schmitt, Julian
F.; Korsgaard, Niels H.; Hu, Jie Kate; Gaines III, George C.; Frescino
Tracey S.; McConville, Kelly S. (2025). Small area estimation of forest
biomass via a two-stage model for continuous zero-inflated data.
Canadian Journal of Forest Research: 55: 1-19. (ver. 1.0).

*For more on data definitions:*

White, Grayson W.; Wieczorek, Jerzy A.; Cody, Zachariah W.; Tan, Emily
X.; Chistolini, Jacqueline O.; McConville, Kelly S.; Frescino, Tracey
S.; Moisen, Gretchen G. (2025). A method for empirically assessing small
area estimators via bootstrap-weighted k-nearest-neighbor artificial
populations, with applications to forest inventory. Forestry: An
International Journal of Forest Research: cpaf071 (ver. 1.0).

*Source data pre-preprocessed using the FIESTA R Package (GPL-3):*

Frescino, Tracey S.; Moisen, Gretchen G.; Patterson, Paul L.; Toney,
Chris; White, Grayson W. (2023). FIESTA: A forest inventory estimation
and analysis R package. Ecography 2023: e06428 (ver. 1.0).

## Data by state

The forested package provides a few data sets, each corresponding to
forest data in one state:

- `forested` corresponds to **Washington** state and is aliased as
  `forested_wa`.

- `forested_ga` corresponds to **Georgia**.

## Examples

``` r
# Washington data:
str(forested)
#> tibble [7,107 × 20] (S3: tbl_df/tbl/data.frame)
#>  $ forested        : Factor w/ 2 levels "Yes","No": 1 1 2 1 1 1 1 1 1 1 ...
#>  $ year            : num [1:7107] 2005 2005 2005 2005 2005 ...
#>  $ elevation       : num [1:7107] 881 113 164 299 806 736 636 224 52 2240 ...
#>  $ eastness        : num [1:7107] 90 -25 -84 93 47 -27 -48 -65 -62 -67 ...
#>  $ northness       : num [1:7107] 43 96 53 34 -88 -96 87 -75 78 -74 ...
#>  $ roughness       : num [1:7107] 63 30 13 6 35 53 3 9 42 99 ...
#>  $ tree_no_tree    : Factor w/ 2 levels "Tree","No tree": 1 1 1 2 1 1 2 1 1 2 ...
#>  $ dew_temp        : num [1:7107] 0.04 6.4 6.06 4.43 1.06 1.35 1.42 6.39 6.5 -5.63 ...
#>  $ precip_annual   : num [1:7107] 466 1710 1297 2545 609 ...
#>  $ temp_annual_mean: num [1:7107] 6.42 10.64 10.07 9.86 7.72 ...
#>  $ temp_january_min: num [1:7107] -8.32 1.4 0.19 -1.2 -5.98 ...
#>  $ temp_annual_min : num [1:7107] -0.08 5.44 5.72 3.95 1.6 1.12 0.99 5.54 6.2 -4.54 ...
#>  $ temp_annual_max : num [1:7107] 12.9 15.8 14.4 15.8 13.8 ...
#>  $ vapor_min       : num [1:7107] 78 34 49 67 114 67 67 31 60 79 ...
#>  $ vapor_max       : num [1:7107] 1194 938 754 1164 1254 ...
#>  $ canopy_cover    : num [1:7107] 50 79 47 42 59 36 14 27 82 12 ...
#>  $ lon             : num [1:7107] -119 -123 -122 -122 -118 ...
#>  $ lat             : num [1:7107] 48.7 47.1 48.8 45.8 48.1 ...
#>  $ land_type       : Factor w/ 3 levels "Barren","Non-tree vegetation",..: 3 3 3 3 3 3 2 2 3 2 ...
#>  $ county          : Factor w/ 39 levels "Adams","Asotin",..: 10 34 37 30 33 33 26 27 27 24 ...
head(forested)
#> # A tibble: 6 × 20
#>   forested  year elevation eastness northness roughness tree_no_tree dew_temp
#>   <fct>    <dbl>     <dbl>    <dbl>     <dbl>     <dbl> <fct>           <dbl>
#> 1 Yes       2005       881       90        43        63 Tree             0.04
#> 2 Yes       2005       113      -25        96        30 Tree             6.4 
#> 3 No        2005       164      -84        53        13 Tree             6.06
#> 4 Yes       2005       299       93        34         6 No tree          4.43
#> 5 Yes       2005       806       47       -88        35 Tree             1.06
#> 6 Yes       2005       736      -27       -96        53 Tree             1.35
#> # ℹ 12 more variables: precip_annual <dbl>, temp_annual_mean <dbl>,
#> #   temp_january_min <dbl>, temp_annual_min <dbl>, temp_annual_max <dbl>,
#> #   vapor_min <dbl>, vapor_max <dbl>, canopy_cover <dbl>, lon <dbl>, lat <dbl>,
#> #   land_type <fct>, county <fct>
all.equal(forested, forested_wa)
#> [1] TRUE

# Georgia data:
str(forested_ga)
#> tibble [10,937 × 19] (S3: tbl_df/tbl/data.frame)
#>  $ forested        : Factor w/ 2 levels "Yes","No": 1 1 1 1 1 1 1 1 1 1 ...
#>  $ year            : num [1:10937] 2007 2007 2006 2007 2006 ...
#>  $ elevation       : num [1:10937] 14 66 59 116 283 250 58 140 118 217 ...
#>  $ eastness        : num [1:10937] 0 -53 -82 -78 63 63 31 56 72 -46 ...
#>  $ roughness       : num [1:10937] 0 10 6 20 13 14 1 11 17 13 ...
#>  $ tree_no_tree    : Factor w/ 2 levels "Tree","No tree": 2 1 2 1 1 1 2 1 1 1 ...
#>  $ dew_temp        : num [1:10937] 13.9 13.8 13.5 12.3 10 ...
#>  $ precip_annual   : num [1:10937] 1255 1227 1211 1304 1354 ...
#>  $ temp_annual_mean: num [1:10937] 19.2 19.1 18.8 18.3 16 ...
#>  $ temp_january_min: num [1:10937] 3.4 3.23 2.71 1.98 -0.43 0.19 3.41 2 1.98 2.68 ...
#>  $ temp_annual_min : num [1:10937] 13.1 12.8 12.6 11.8 10 ...
#>  $ temp_annual_max : num [1:10937] 25.4 25.4 25.1 24.7 21.9 ...
#>  $ vapor_min       : num [1:10937] 61 66 57 92 90 61 59 100 98 100 ...
#>  $ vapor_max       : num [1:10937] 1749 1849 1785 1844 1545 ...
#>  $ canopy_cover    : num [1:10937] 22 82 9 66 27 79 30 58 75 90 ...
#>  $ lon             : num [1:10937] -81.4 -82.6 -81.7 -84.9 -84.4 ...
#>  $ lat             : num [1:10937] 32.3 31.7 32.4 32.4 34.1 ...
#>  $ land_type       : Factor w/ 3 levels "Barren","Non-tree vegetation",..: 3 3 2 3 3 3 3 2 3 3 ...
#>  $ county          : Factor w/ 159 levels "Appling","Atkinson",..: 51 80 16 26 28 31 34 26 26 96 ...
head(forested_ga)
#> # A tibble: 6 × 19
#>   forested  year elevation eastness roughness tree_no_tree dew_temp
#>   <fct>    <dbl>     <dbl>    <dbl>     <dbl> <fct>           <dbl>
#> 1 Yes       2007        14        0         0 No tree          13.9
#> 2 Yes       2007        66      -53        10 Tree             13.8
#> 3 Yes       2006        59      -82         6 No tree          13.5
#> 4 Yes       2007       116      -78        20 Tree             12.3
#> 5 Yes       2006       283       63        13 Tree             10.0
#> 6 Yes       2007       250       63        14 Tree             10.8
#> # ℹ 12 more variables: precip_annual <dbl>, temp_annual_mean <dbl>,
#> #   temp_january_min <dbl>, temp_annual_min <dbl>, temp_annual_max <dbl>,
#> #   vapor_min <dbl>, vapor_max <dbl>, canopy_cover <dbl>, lon <dbl>, lat <dbl>,
#> #   land_type <fct>, county <fct>
```

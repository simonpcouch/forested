#' Forest Attributes in the U.S.
#'
#' @description
#' The U.S. Department of Agriculture, Forest Service, Forest Inventory and
#' Analysis (FIA) Program provides all sorts of
#' estimates of forest attributes for uses in research, legislation, and land
#' management. The FIA uses a set of criteria to classify a plot of land as
#' "forested" or "non-forested," and that classification is a central data
#' point in many decision-making contexts. A small subset of plots in
#' the U.S. are sampled and assessed "on-the-ground" as forested or
#' non-forested, but the FIA has access to remotely sensed data for all land
#' in the country. Practitioners can develop a model on the more easily-accessible
#' remotely sensed data to predict whether a plot is forested or non-forested.
#'
#' @format
#'
#' A data frame with:
#'
#' \describe{
#'   \item{forested}{Whether the plot is classified as "forested" or not,
#'     as a factor with levels `"Yes"` and `"No"`.}
#'   \item{year}{Year when the plot was classified "on-the-ground" as forested
#'     or not. The remaining, remotely-sensed variables are measured at
#'     different times or averaged over multiple years.}
#'   \item{elevation}{Elevation, in meters.}
#'   \item{eastness}{Transformed aspect degrees to eastness (-100 to 100).}
#'   \item{northness}{Transformed aspect degrees to northness (-100 to 100).}
#'   \item{roughness}{Degree of irregularity of the plot.}
#'   \item{tree_no_tree}{LANDFIRE tree/non-tree lifeform mask, as a factor
#'     with levels `"Tree"` and `"No tree"`.}
#'   \item{dew_temp}{Mean annual dewpoint temperature (1991-2020), in degrees
#'     Celsius.}
#'   \item{precip_annual}{Mean annual precipitation (1991-2020), in mm × 100.}
#'   \item{temp_annual_mean}{Mean annual temperature (1991-2020), in degrees
#'     Celsius.}
#'   \item{temp_annual_min}{Mean annual minimum temperature (1991-2020), in
#'     degrees Celsius.}
#'   \item{temp_annual_max}{Mean annual maximum temperature (1991-2020), in
#'     degrees Celsius.}
#'   \item{temp_january_min}{Mean minimum temperature in January (1991-2020), in
#'     degrees Celsius.}
#'   \item{vapor_min, vapor_max}{Minimum and maximum annual vapor pressure
#'     deficit (1991-2020), in Pa x 100.}
#'   \item{canopy_cover}{Analytical Tree Canopy Cover, as a percent.}
#'   \item{lon, lat}{The longitude and latitude of the center of the plot
#'     with a slight perturbation.}
#'   \item{land_type}{Land cover type from European Space Agency (ESA) 2020
#'     WorldCover global land cover product, as a factor with levels
#'     `"Tree"`, `"Non-tree vegetation"`, and `"Barren"`.}
#'   \item{county}{The county in the state, as a factor.}
#' }
#'
#' The number of rows varies by state. Washington has `r nrow(forested_wa)` rows,
#' Georgia has `r nrow(forested_ga)`.
#'
#' The Georgia data has one less column than the Washington data as its
#' `northness` column has been omitted due to issues with the source raster.
#'
#' @section Data by state:
#'
#' The forested package provides a few data sets, each corresponding to forest
#' data in one state:
#'
#' * `forested` corresponds to **Washington** state and is aliased as `forested_wa`.
#' * `forested_ga` corresponds to **Georgia**.
#'
#' @source
#' _For more information on the source data, see Table 1 in:_
#'
#' White, Grayson W.; Yamamoto, Josh K.; Elsyad, Dinan H.;
#' Schmitt, Julian F.; Korsgaard, Niels H.; Hu, Jie Kate;
#' Gaines III, George C.; Frescino Tracey S.; McConville, Kelly
#' S. (2025). Small area estimation of forest biomass via a two-stage
#' model for continuous zero-inflated data. Canadian Journal of
#' Forest Research: 55: 1-19. (ver. 1.0).
#'
#' _For more on data definitions:_
#'
#' White, Grayson W.; Wieczorek, Jerzy A.; Cody, Zachariah W.; Tan, Emily X.;
#' Chistolini, Jacqueline O.; McConville, Kelly S.; Frescino, Tracey S.;
#' Moisen, Gretchen G. (2025). A method for empirically assessing small
#' area estimators via bootstrap-weighted k-nearest-neighbor artificial
#' populations, with applications to forest inventory. Forestry: An
#' International Journal of Forest Research: cpaf071 (ver. 1.0).
#'
#' _Source data pre-preprocessed using the FIESTA R Package (GPL-3):_
#'
#' Frescino, Tracey S.; Moisen, Gretchen G.; Patterson, Paul L.; Toney, Chris;
#' White, Grayson W. (2023). FIESTA: A forest inventory estimation and analysis
#' R package. Ecography 2023: e06428 (ver. 1.0).
#'
#' @name forested
#' @aliases forested_wa
#' @examples
#' # Washington data:
#' str(forested)
#' head(forested)
#' all.equal(forested, forested_wa)
#'
#' # Georgia data:
#' str(forested_ga)
#' head(forested_ga)
"forested"

#' @rdname forested
"forested_wa"

#' @rdname forested
"forested_ga"

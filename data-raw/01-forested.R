# Source code to transform `data-raw/wa_plts.rds` into `data/forested.rda`.
library(tidyverse)
library(janitor)

wa_plts <- read_rds("data-raw/wa_plts.rds")

forested <-
  wa_plts %>%
  as_tibble() %>%
  select(-CN, -COUNTYNM, -aboveground_biomass_tpa, -MEASDAY, -MEASMON) %>%
  clean_names() %>%
  mutate(
    forested = if_else(forested == 1, "Yes", "No"),
    tree_no_tree = if_else(tree_no_tree == 2, "Tree", "No tree"),
    land_type = as.factor(worldcover_3cl),
    across(where(is.character), as.factor),
    across(where(is.integer), as.numeric)
  ) %>%
  select(-worldcover_3cl) %>%
  relocate(forested, .before = everything()) %>%
  rename(
    year = measyear,
    elevation = elev,
    lon = lon_public,
    lat = lat_public,
    dew_temp = tdmean,
    annual_precip = ppt,
    annual_mean_temp = tmean,
    annual_max_temp = tmax,
    annual_min_temp = tmin,
    january_min_temp = tmin_annual,
    max_vapor = vpdmax,
    min_vapor = vpdmin,
    canopy_cover = tcc
  ) %>%
  relocate(dew_temp, .before = annual_precip) %>%
  relocate(annual_mean_temp, .before = annual_max_temp) %>%
  relocate(annual_max_temp, .after = annual_min_temp) %>%
  relocate(max_vapor, .after = min_vapor)

usethis::use_data(forested, overwrite = TRUE)

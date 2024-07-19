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
    forested = factor(forested, levels = c("Yes", "No")),
    tree_no_tree = if_else(tree_no_tree == 2, "Tree", "No tree"),
    land_type = case_when(
      worldcover_3cl == 1 ~ "Tree",
      worldcover_3cl == 2 ~ "Non-tree vegetation",
      worldcover_3cl == 3 ~ "Barren"
    ),
    land_type = as.factor(land_type),
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
    precip_annual = ppt,
    temp_annual_mean = tmean,
    temp_annual_max = tmax,
    temp_annual_min = tmin,
    temp_january_min = tmin_annual,
    vapor_max = vpdmax,
    vapor_min = vpdmin,
    canopy_cover = tcc
  ) %>%
  relocate(dew_temp, .before = precip_annual) %>%
  relocate(temp_annual_mean, .before = temp_annual_max) %>%
  relocate(temp_annual_max, .after = temp_annual_min) %>%
  relocate(vapor_max, .after = vapor_min)

usethis::use_data(forested, overwrite = TRUE)

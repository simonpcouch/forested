# Source code to transform `data-raw/wa_plts.rds` into `data/forested.rda`.
library(tidyverse)
library(janitor)

wa_plts <- read_rds("data-raw/wa/wa_plts.rds")

forested <-
  wa_plts %>%
  as_tibble() %>%
  select(-CN, -COUNTYNM, -aboveground_biomass_tpa, -MEASDAY, -MEASMON) %>%
  clean_names() %>%
  mutate(
    forested = if_else(forested == 1, "Yes", "No"),
    forested = factor(forested, levels = c("Yes", "No")),
    tree_no_tree = if_else(tree_no_tree == 1, "Tree", "No tree"),
    tree_no_tree = factor(tree_no_tree, levels = c("Tree", "No tree")),
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
  mutate(
    dew_temp = dew_temp / 100,
    temp_annual_mean = temp_annual_mean / 100,
    temp_annual_min = temp_annual_min / 100,
    temp_annual_max = temp_annual_max / 100,
    temp_january_min = temp_january_min / 100
  ) %>%
  relocate(dew_temp, .before = precip_annual) %>%
  relocate(temp_annual_mean, .before = temp_annual_max) %>%
  relocate(temp_annual_max, .after = temp_annual_min) %>%
  relocate(vapor_max, .after = vapor_min) %>%
  filter(!is.na(land_type))

usethis::use_data(forested, overwrite = TRUE)

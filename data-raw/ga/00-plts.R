# Source code to generate the `ga_plts.rds` dataset. This script depends on
# confidential raster files.
# pak::pak(c(
#   "USDAForestService/FIESTA@v3.6.4",
#   "USDAForestService/FIESTAutils@c3f6331"
# ))
library(FIESTA)
library(tidyverse)

pltdat <- spGetPlots(
  bnd = stunitco %>% filter(STATENM == "Georgia"),
  xy_datsource = "datamart",
  datsource = "datamart",
  eval = "custom",
  eval_opts = eval_options(Cur = TRUE),
  intensity1 = TRUE
)

# saveRDS(pltdat, file = 'data-raw/ga/pltdat.rds')
# pltdat <- readRDS("data-raw/ga/pltdat.rds")

# get average biomass (tons/acre) for each plot
biomassdat <- datSumTree(
  tree = pltdat$tabs$tree,
  plt = pltdat$tabs$plt,
  cond = pltdat$tabs$cond,
  tsumvarlst = "DRYBIO_AG",
  adjtree = TRUE,
  NAto0 = TRUE
)

# get number of doug-fir trees for each plot
dfdat <- datSumTree(
  tree = pltdat$tabs$tree,
  plt = pltdat$tabs$plt,
  cond = pltdat$tabs$cond,
  tsumvarlst = "TPA_UNADJ",
  TPA = FALSE,
  # adjtree = TRUE,
  NAto0 = TRUE
)

dougfir_count <- dfdat$treedat %>%
  select(CN, COUNT) %>%
  rename(doug_fir_count = COUNT)

auxdat <- spGetAuxiliary(
  xyplt = biomassdat$treedat,
  uniqueid = "CN",
  unit_layer = stunitco %>% filter(STATENM == "Georgia"),
  unitvar = "COUNTYNM",
  rastfolder = "data-raw/ga/rasters",
  rastlst.cont = list.files("data-raw/ga/rasters"),
  rastlst.cont.name = c(
    "elev",
    "eastness",
    "roughness",
    "tree_no_tree",
    "ppt",
    "tdmean",
    "tmax",
    "tmean",
    "tmin",
    "tmin_annual",
    "vpdmax",
    "vpdmin",
    "tcc",
    "worldcover_3cl"
  ),
  spMakeSpatial_opts = list(xvar = "LON_PUBLIC", yvar = "LAT_PUBLIC")
)

ga_plts <- auxdat$pltassgn %>%
  select(
    CN,
    MEASYEAR,
    MEASMON,
    MEASDAY,
    FORNONSAMP,
    DRYBIO_AG_TON_TPA_ADJ,
    COUNTYNM,
    elev,
    eastness,
    roughness,
    tree_no_tree,
    ppt,
    tdmean,
    tmax,
    tmean,
    tmin,
    tmin_annual,
    vpdmax,
    vpdmin,
    tcc,
    worldcover_3cl
  ) %>%
  left_join(
    biomassdat$treedat %>% select(CN, LON_PUBLIC, LAT_PUBLIC),
    by = "CN"
  ) %>%
  mutate(forested = ifelse(FORNONSAMP == "Sampled-Forest", 1, 0)) %>%
  select(-FORNONSAMP) %>%
  rename(aboveground_biomass_tpa = DRYBIO_AG_TON_TPA_ADJ)

saveRDS(ga_plts, file = "data-raw/ga/ga_plts.rds")

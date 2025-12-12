# Fetch and save WFS layer metadata for tutorials
#
# This script fetches attribute tables from EMODnet Human Activities WFS
# and saves them as package data. Run this script when layer schemas change.
#
# Usage: source("data-raw/wfs_layer_metadata.R")

library(emodnet.wfs)
library(purrr)

# Connect to Human Activities WFS
wfs <- emodnet_init_wfs_client(service = "human_activities")

# Define layers for tutorials
protected_area_layers <- c("cddaareas", "natura2000areas", "marineprotectedareas")
infrastructure_layers <- c(
  "platforms",
  "pipelines",
  "pcablesbshcontis",
  "pcablesshom",
  "pcablesrijks",
  "pcablesnve"
)

# Fetch attribute tables (without geometry - much faster)
mpa_attr_tbls <- map(
  set_names(protected_area_layers),
  ~ layer_attributes_tbl(wfs = wfs, layer = .x)
)

infra_attr_tbls <- map(
  set_names(infrastructure_layers),
  ~ layer_attributes_tbl(wfs = wfs, layer = .x)
)

# Save as package data
usethis::use_data(
  mpa_attr_tbls,
  infra_attr_tbls,
  overwrite = TRUE
)

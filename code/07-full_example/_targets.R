# Libraries ----
library(targets)
library(tarchetypes)
library(crew)
library(tidymodels)

# Source ----
lapply(fs::dir_ls("pipelines/", glob = "*.R"), tar_source)
lapply(fs::dir_ls("R/", glob = "*.R"), tar_source)

# Settings ----
tar_option_set(
  controller = crew_controller_local(workers = 6),
  format = "qs",
  packages = c(
    "recipes",
    "rsample",
    "yardstick",
    "parsnip",
    "workflows",
    "broom",
    "dplyr",
    "plotly"
  )
)

# Targets ----
list(
  pipe_data,
  pipe_models,
  pipe_post
)

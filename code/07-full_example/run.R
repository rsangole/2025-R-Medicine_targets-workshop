setwd(here::here("code/07-full_example"))

library(targets)

# Visualize the pipeline graph
tar_visnetwork()

tar_visnetwork(
  targets_only = TRUE,
  label = "branches"
)

tar_watch()

# Run the pipeline
tar_make()


# Uncomment new models
# Does tar_watch() update the graph?
tar_outdated()
tar_make()

# Visualize the pipeline graph
tar_visnetwork(
  targets_only = TRUE,
  label = "branches"
)
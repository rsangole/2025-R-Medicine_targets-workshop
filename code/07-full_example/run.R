setwd(here::here("code/07-full_example"))

library(targets)

# Visualize the pipeline graph
tar_visnetwork()

tar_watch()

# Run the pipeline
tar_make()

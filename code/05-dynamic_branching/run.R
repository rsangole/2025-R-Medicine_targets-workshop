setwd(here::here("code/05-dynamic_branching"))

library(targets)

# Visualize the pipeline graph
tar_visnetwork()

tar_watch()

# Run the pipeline
tar_make()

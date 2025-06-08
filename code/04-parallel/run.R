setwd(here::here("code/04-parallel"))

library(targets)

# Visualize the pipeline graph
tar_visnetwork()

# Review the lm function

# Run the pipeline
tar_make()

# Visualize the pipeline graph
tar_visnetwork()

# Introduce tar_watch()
tar_watch()

tar_destroy()

tar_make()

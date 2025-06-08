setwd(here::here("code/01-basics"))

library(targets)

# Visualize the pipeline graph
tar_visnetwork()

# Run the pipeline
tar_make()

# Visualize the pipeline graph
tar_visnetwork()

# Check the status of targets
tar_outdated()
tar_progress()

# Read the output of a target
tar_read(tbl_clean)

# Load target values into your R session
tar_load(tbl_clean)

# Show metadata about targets
tar_meta()

# Clean up all target outputs
tar_destroy()

# ?targets::`targets-package`
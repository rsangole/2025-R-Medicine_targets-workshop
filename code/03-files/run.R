setwd(here::here("code/03-files"))

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
tar_read(local_file)

# Change the input file
tar_visnetwork()
tar_outdated()
tar_make()

# Change the output file
tar_visnetwork()
tar_outdated()
tar_make()


# Further reading
# https://books.ropensci.org/targets/data.html#clean-up-local-files

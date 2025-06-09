setwd(here::here("code/02-functions"))

library(targets)

# Visualize the pipeline graph
tar_visnetwork()

# Run the pipeline
tar_make()

# Visualize the pipeline graph
tar_visnetwork()

# Visualize the pipeline graph -
# targets only, (hide the functions)
tar_visnetwork(targets_only = TRUE)

# Check the status of targets
tar_outdated()
tar_progress()

# Read the output of a target
tar_read(tbl_clean)
tar_read(tbl_means)
tar_read(plot_scatter)
tar_read(mod_lm)

# Load target values into your R session
tar_load(tbl_clean)

# Show metadata about targets
tar_meta()

# Show targets with errors
tar_meta(fields = error)

# Clean up all target outputs
tar_destroy()
tar_meta()


# ?targets::`targets-package`


# Exercise

# *Add a data transformation and visualization step.*

# -   Add a new target called `tbl_counts` which counts the number of rows in `tbl_clean` by `c("gender", "education")`
# -   Add another target `plot_bar` that creates a bar plot of the counts
# -   Visualize the updated pipeline with `tar_visnetwork()`
# -   Run the pipeline and use `tar_read()` to inspect your new targets

# * Stretch goals

# 1. What happens if you add some white spaces or comments in a function like `fn_plot_scatter()`? Does targets re-run the pipeline?
# 2. Try to change the function to force downstream targets to be invalidated. Confirm using `tar_visnetwork()` or `tar_outdated()`.
# 3. Try introducing an error in one of the functions or targets. What happens? Can you visualize the error in the network?

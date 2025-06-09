setwd(here::here("code/05-dynamic_branching"))

library(targets)

# Visualize the pipeline graph
tar_visnetwork(
  targets_only = TRUE,
  label = "branches"
)

tar_watch()

# Run the pipeline
tar_make()

# Inspect the results
tar_read(vec_home_own)
tar_read(vec_education)

tar_read(tbl_list_edu)
tar_read(tbl_list_edu, 1)
tar_read(tbl_list_edu, 2)

tar_read(tbl_list_home_edu)
length(tar_read(tbl_list_home_edu))

tar_read(tbl_list_home_edu, 1)
tar_read(tbl_list_home_edu, 2)


length(tar_read(mod_lm_edu))
tar_read(mod_lm_edu, 1)
tar_read(mod_lm_edu, 2)

tar_read(mod_lm_edu_coeffs, 1)

length(tar_read(mod_lm_home_edu))
tar_read(mod_lm_home_edu, 1)
tar_read(mod_lm_home_edu_coeffs, 1)

# Exercise: Add a new target to the pipeline
# - Use dynamic branching to split `tbl_NHANES` by `age_decade`
# - For each branch, calculate the mean and standard deviation of `bmi`
# - Add a downstream target that combines all summaries into a single tidy
#   data frame

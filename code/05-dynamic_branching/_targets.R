# Libraries ----
library(targets)
library(crew)

# Source ----
tar_source("functions.R")

# Settings ----
tar_option_set(
  controller = crew_controller_local(workers = 6),
  format = "qs",
  packages = c("dplyr", "janitor", "plotly", "NHANES")
)

# This is a dynamic branching example
# where we create a list of dataframes
# based on the values of two categorical variables
# and then build a linear model for each
# of those dataframes.

# The models are then summarized and returned
# as a list of tidy dataframes.

# Targets ----
list(
  # * Input data ----
  tar_target(tbl_NHANES, NHANES::NHANES |>
    fn_clean()),

  # * Vectors ----
  tar_target(
    vec_home_own,
    levels(tbl_NHANES$home_own) # 3 levels
  ),
  tar_target(
    vec_education,
    levels(tbl_NHANES$education) # 5 levels
  ),


  # * Simple mapping ----
  tar_target(tbl_list_edu,
    {
      tbl_NHANES |>
        filter(education == vec_education)
    },
    pattern = map(vec_education)
  ),

  # * Models
  # Let's build a linear model for each filtered dataframe
  tar_target(
    mod_lm_edu,
    fn_lm_mod(tbl_list_edu, formula = formula(bmi ~ age)),
    pattern = map(tbl_list_edu),
    iteration = "list"
  ),
  tar_target(
    mod_lm_edu_coeffs,
    broom::tidy(mod_lm_edu),
    pattern = map(mod_lm_edu),
    iteration = "list"
  ),

  # * Cross mapping  ----
  tar_target(
    tbl_list_home_edu,
    {
      tbl_NHANES |>
        filter(home_own == vec_home_own, education == vec_education)
    },
    pattern = cross(vec_home_own, vec_education),
    iteration = "list"
  ),

  # * Models
  tar_target(
    mod_lm_home_edu,
    fn_lm_mod(tbl_list_home_edu, formula = formula(bmi ~ age)),
    pattern = map(tbl_list_home_edu),
    iteration = "list"
  ),
  tar_target(
    mod_lm_home_edu_coeffs,
    broom::tidy(mod_lm_home_edu),
    pattern = map(mod_lm_home_edu),
    iteration = "list"
  )

  # Exercise ----
  # Don't forget to add a "," after the last target ^^
  # Your code here....
)

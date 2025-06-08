library(targets)
library(crew)

tar_source("functions.R")

tar_option_set(
  controller = crew_controller_local(workers = 6),
  format = "qs",
  packages = c("dplyr", "janitor", "plotly", "NHANES")
)

list(
  # Full dataset
  tar_target(tbl_NHANES, NHANES::NHANES |>
    fn_clean()),

  # Vectors
  tar_target(
    vec_home_own,
    # 3 levels
    levels(tbl_NHANES$home_own)
  ),
  tar_target(
    vec_education,
    # 5 levels
    levels(tbl_NHANES$education)
  ),


  # Simple map
  tar_target(tbl_list_edu,
    {
      tbl_NHANES |>
        filter(education == vec_education)
    },
    pattern = map(vec_education)
  ),


  # Cross map
  tar_target(
    tbl_list_home_edu,
    {
      tbl_NHANES |>
        filter(home_own == vec_home_own, education == vec_education)
    },
    pattern = cross(vec_home_own, vec_education),
    iteration = "list"
  ),

  # Model
  ## Let's build a linear model for each
  ## filtered dataframe
  tar_target(
    mod_lm,
    fn_lm_mod(tbl_list_home_edu, formula = formula(bmi ~ age)),
    pattern = map(tbl_list_home_edu),
    iteration = "list"
  ),
  tar_target(
    mod_lm_coeffs,
    broom::tidy(mod_lm),
    pattern = map(mod_lm),
    iteration = "list"
  )
)

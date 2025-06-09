# Libraries ----
library(targets)
library(crew)

# Source ----
tar_source("functions.R")

# Settings ----
tar_option_set(
  controller = crew_controller_local(workers = 4),
  format = "qs",
  packages = c("dplyr", "janitor", "plotly", "NHANES")
)

# Targets ----
list(
  # * Input data ----
  tar_target(
    tbl_NHANES,
    NHANES::NHANES |>
      fn_clean()
  ),

  # * Models ----

  ## Model 1
  tar_target(
    mod_lm1,
    fn_lm_mod(tbl_NHANES,
      formula = formula(bmi ~ age)
    )
  ),
  tar_target(mod_lm_coeffs1, broom::tidy(mod_lm1)),

  ## Model 2
  tar_target(
    mod_lm2,
    fn_lm_mod(tbl_NHANES,
      formula = formula(bmi ~ marital_status)
    )
  ),
  tar_target(mod_lm_coeffs2, broom::tidy(mod_lm2)),

  ## Model 3
  tar_target(
    mod_lm3,
    fn_lm_mod(tbl_NHANES,
      formula = formula(bmi ~ age + bp_sys1)
    )
  ),
  tar_target(mod_lm_coeffs3, broom::tidy(mod_lm3)),

  ## Model 4
  tar_target(
    mod_lm4,
    fn_lm_mod(tbl_NHANES,
      formula = formula(bmi ~ age + gender + bp_sys1)
    )
  ),
  tar_target(mod_lm_coeffs4, broom::tidy(mod_lm4)),

  ## Model 5
  tar_target(
    mod_lm5,
    fn_lm_mod(tbl_NHANES,
      formula = formula(bmi ~ race1 + education + hh_income_mid)
    )
  ),
  tar_target(mod_lm_coeffs5, broom::tidy(mod_lm5))

  # Exercise ----
  # Your code here....
)

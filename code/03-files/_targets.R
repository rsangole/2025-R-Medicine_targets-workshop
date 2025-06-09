# Libraries ----
library(targets)
library(tarchetypes)

# Source ----
tar_source("functions.R")

# Settings ----
tar_option_set(
  format = "rds", # qs
  packages = c(
    "dplyr", "janitor",
    "plotly", "NHANES"
  )
)

# Targets ----
list(
  # * Input data ----
  tar_target(
    # Target name
    local_file,
    # Path
    "data/NHANES.csv",
    # * This tells targets that this string is a file
    format = "file"
  ),
  tar_target(
    tbl_NHANES,
    readr::read_csv(local_file)
  ),

  # * Subset ----
  tar_target(
    tbl_NHANES_subset,
    tbl_NHANES |>
      select(one_of(fn_cols()))
  ),

  # * Cleanup ----
  tar_target(
    tbl_clean,
    fn_clean(tbl_NHANES_subset)
  ),

  # * Model ----
  tar_target(mod_lm, fn_lm_mod(tbl_clean)),
  tar_target(mod_lm_coeffs, broom::tidy(mod_lm)),

  # * Export ----
  tar_target(
    export_mod_lm_coeffs,
    {
      output_file <- "data/mod_lm_coeffs.csv"

      mod_lm_coeffs |>
        readr::write_csv(output_file)

      output_file
    },
    format = "file" # This tells targets that this string is a file
  ),

  # * Report ----
  tar_render(
    report,
    path = "report.qmd",
    params = list(
      tbl_coeff = mod_lm_coeffs
    )
  )

  # Exercise ----
  # Your code here....
)

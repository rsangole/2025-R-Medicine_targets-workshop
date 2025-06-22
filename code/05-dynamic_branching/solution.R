tar_target(
  vec_age_decade,
  unique(tbl_NHANES$age_decade)
),

tar_target(
  tbl_statistics,
  {
    tbl_NHANES |>
      dplyr::filter(
        age_decade == vec_age_decade
      ) |>
      dplyr::summarise(
        mean_bmi = mean(bmi, na.rm = TRUE),
        sd_bmi = sd(bmi, na.rm = TRUE),
        .by = "age_decade"
      )
  },
  pattern = map(vec_age_decade),
  iteration = "list"
)
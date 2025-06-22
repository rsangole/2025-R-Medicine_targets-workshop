  tar_target(
    tbl_means,
    tbl_clean |>
      summarise(
        mean_bmi = mean(bmi, na.rm = TRUE),
        .by = c("gender")
      )
  ),
  tar_target(
    export_tbl_means,
    {
      output_file <- "output/tbl_means.csv"

      tbl_means |>
        readr::write_csv(output_file)

      output_file
    },
    format = "file"
  ),
  tar_target(
    file_loc,
    "data/mtcars.csv"
  )
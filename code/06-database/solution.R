tar_target(
  tbl_age_gt_40,
  {
    withr::with_db_connection(
      list(con = dbConnect(SQLite(), "workshop.db")),
      {
        tbl(con, "DATA") |>
          dplyr::filter(age > 40) |>
          collect()
      }
    )
  }
),
tar_target(
  export_tbl_age_gt_40,
  {
    withr::with_db_connection(
      list(con = dbConnect(SQLite(), "workshop.db")),
      {
        dbWriteTable(con, "DATA_GT_AGE_40", tbl_age_gt_40, overwrite = TRUE)
      }
    )
  }
)
# Libraries ----
library(targets)

# Settings ----
tar_option_set(
  format = "qs",
  packages = c(
    # Adding a few new packages...
    "withr",
    "DBI",
    "RSQLite",
    # ....
    "dplyr",
    "janitor", "plotly", "NHANES"
  )
)

# Targets ----
list(
  tar_target(
    tbl_from_database,
    {
      withr::with_db_connection(
        list(con = dbConnect(SQLite(), "workshop.db")),
        {
          tbl(con, "DATA") |>
            # dplyr::filter(Age > 10) |>
            collect()
        }
      )
    }
  ),
  tarchetypes::tar_age(
    tbl_from_database_aged,
    {
      withr::with_db_connection(
        list(con = dbConnect(SQLite(), "workshop.db")),
        {
          tbl(con, "DATA") |>
            collect()
        }
      )
    },
    age = as.difftime(1, units = "mins")
  ),
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
)

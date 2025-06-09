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
  )

  # Exercise ----
  # Don't forget to add a "," after the last target ^^
  # Your code here....
)

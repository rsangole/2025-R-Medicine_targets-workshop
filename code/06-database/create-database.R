# Let's create a local database using SQLite

library(RSQLite)
library(dplyr)

con <- dbConnect(SQLite(), "workshop.db")

data <- NHANES::NHANES |>
  janitor::clean_names() |>
  dplyr::slice_head(n = 100)

dbCreateTable(con, "DATA", data)

dbWriteTable(con, "DATA", data, append = TRUE)

tbl(con, "DATA")

dbDisconnect(con)

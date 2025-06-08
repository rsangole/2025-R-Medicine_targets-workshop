setwd(here::here("code/06-database"))

library(targets)
library(RSQLite)
library(dplyr)

# Let's create a local database using SQLite

# con <- dbConnect(SQLite(), "workshop.db")
# dbCreateTable(con, "DATA", NHANES::NHANES)
# dbWriteTable(con, "DATA", NHANES::NHANES[1:100, ], append = TRUE)
# tbl(con, "DATA")
# dbDisconnect(con)

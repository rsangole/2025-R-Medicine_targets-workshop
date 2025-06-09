setwd(here::here("code/06-database"))

library(targets)
library(RSQLite)
library(dplyr)

tar_make()

tar_read(tbl_from_database)
tar_read(tbl_from_database_aged)

# Wait 1 minute
tar_outdated()
tar_visnetwork(targets_only = TRUE)

tar_make()
tar_visnetwork(targets_only = TRUE)
tar_outdated()


# Exercise

# *Read from the database within the pipeline.*
#
# - Add a new target `tbl_age_gt_40` that reads only rows where `Age > 40` from the SQLite database.
# - Use `dplyr::filter()` inside the target code.
# - Run the pipeline and inspect the filtered data.


# *Write to the database within the pipeline.*
#
#   - Write `tbl_age_gt_40` to a new table called `DATA_GT_AGE_40` in the SQLite database

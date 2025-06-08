# This file holds our functions
fn_clean <- function(tbl) {
  tbl |>
    janitor::clean_names() |>
    tidyr::drop_na()
}

fn_cols <- function() {
  c(
    "ID",
    "SurveyYr",
    "Gender",
    "Age",
    "Education",
    "MaritalStatus",
    "HHIncome",
    "HomeOwn",
    "Work",
    "Diabetes",
    "BMI",
    "TotChol",
    "BPSysAve",
    "BPDiaAve"
  )
}

fn_lm_mod <- function(tbl) {
  tbl_2 <- tbl |>
    filter(bp_dia_ave > 0, bp_sys_ave > 0)

  # Sys.sleep(5)

  lm(bp_dia_ave ~ bp_sys_ave + gender + age, tbl_2)
}

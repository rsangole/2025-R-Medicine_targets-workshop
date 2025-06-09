# This file holds our functions
fn_clean <- function(tbl) {
  tbl |>
    janitor::clean_names()
}

fn_lm_mod <- function(tbl, formula) {
  Sys.sleep(10)

  lm(formula, tbl)
}

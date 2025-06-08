setwd(here::here("code/02-functions"))

library(targets)
library(dplyr)
library(janitor)
library(plotly)
library(NHANES)

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

fn_plot_scatter <- function(tbl) {
  plot_ly(
    tbl,
    x = ~ bp_dia_ave,
    y = ~ bp_sys_ave,
    color = ~ diabetes,
    alpha = 0.5
  ) |>
    add_markers()
}

fn_plot_bar <- function(tbl) {
  plot_ly(tbl,
          x = ~ bmi,
          y = ~ diabetes,
          color = ~ gender) |>
    add_bars()
}

fn_lm_mod <- function(tbl) {
  tbl_2 <- tbl |>
    filter(bp_dia_ave > 0, bp_sys_ave > 0)
  
  # Sys.sleep(5)
  
  lm(bp_dia_ave ~ bp_sys_ave + gender + age, tbl_2)
}

list(
  # Full dataset
  tar_target(
    tbl_NHANES_subset, 
    NHANES |>
      select(one_of(fn_cols()))
    ),
  
  
  # Cleanup
  tar_target(
    tbl_clean,
    tbl_NHANES_subset |>
      janitor::clean_names() |>
      tidyr::drop_na()
  ),
  
  
  
  # Summaries
  tar_target(tbl_means, tbl_clean |>
               summarise(
                 across(where(is.numeric), mean), .by = c("gender", "diabetes")
               )),
  
  tar_target(tbl_counts, tbl_clean |>
               summarise(
                 n = n(),
                 .by = c("gender", "education", "marital_status")
               )),
  
  
  
  # Graphs
  tar_target(plot_scatter, fn_plot_scatter(tbl_clean)),
  
  tar_target(plot_bar, fn_plot_bar(tbl_clean)),
  
  # Model
  tar_target(mod_lm, fn_lm_mod(tbl_clean)),
  tar_target(mod_lm_summary, summary(mod_lm))
)
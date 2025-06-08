setwd(here::here("code/01-basics"))

library(targets)
library(dplyr)
library(janitor)
library(plotly)
library(NHANES)

list(
  # Full dataset
  tar_target(
    tbl_NHANES_subset,
    NHANES |>
      select(
        ID,
        SurveyYr,
        Gender,
        Age,
        Education,
        MaritalStatus,
        HHIncome,
        HomeOwn,
        Work,
        Diabetes,
        BMI,
        TotChol,
        BPSysAve,
        BPDiaAve
      )
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
  tar_target(
    plot_scatter,
    plot_ly(
      tbl_clean,
      x = ~ bp_dia_ave,
      y = ~ bp_sys_ave,
      color = ~ diabetes,
      alpha = 0.4
    ) |>
      add_markers()
  ),
  
  tar_target(
    plot_bar,
    
    plot_ly(
      tbl_means,
      x = ~ bmi,
      y = ~ diabetes,
      color = ~ gender
    ) |>
      add_bars()
  ),
  
  
  # Model
  tar_target(
    mod_lm,
    {
      tbl_2 <- tbl_clean |>
        filter(bp_dia_ave > 0, bp_sys_ave > 0)
      
      lm(bp_dia_ave ~ bp_sys_ave + gender + age, tbl_2)
    }
  ),
  
  tar_target(
    mod_lm_summary,
    summary(mod_lm)
  )
)
setwd(here::here("code/01-basics"))

library(dplyr)
library(janitor)
library(plotly)
library(NHANES)

glimpse(NHANES)

# Data ----
tbl_NHANES_subset <- NHANES |>
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
tbl_NHANES_subset

# Cleanup ----
tbl_clean <- tbl_NHANES_subset |>
  janitor::clean_names() |>
  tidyr::drop_na()
tbl_clean

# Summaries ----
tbl_means <- tbl_clean |>
  summarise(across(where(is.numeric), mean), .by = c("gender", "diabetes"))
tbl_means

# Graphs ----
plot_ly(
  tbl_clean,
  x = ~bp_dia_ave,
  y = ~bp_sys_ave,
  color = ~diabetes,
  alpha = 0.4
) |>
  add_markers()

# Model ----
tbl_2 <- tbl_clean |>
  filter(bp_dia_ave > 0, bp_sys_ave > 0)

mod_lm <- lm(bp_dia_ave ~ bp_sys_ave + gender + age, tbl_2)
summary(mod_lm)

tar_target(tbl_counts, tbl_clean |>
  summarise(
    n = n(),
    .by = c("gender", "education")
  ))

fn_plot_bar <- function(tbl) {
  plot_ly(tbl,
    x = ~bmi,
    y = ~diabetes,
    color = ~gender
  ) |>
    add_bars()
}


tar_target(plot_bar, fn_plot_bar(tbl_counts))

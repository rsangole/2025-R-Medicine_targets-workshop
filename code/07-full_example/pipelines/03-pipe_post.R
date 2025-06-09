pipe_post <- list(
  # Visualizations
  tar_target(
    conf_plot,
    plot_confusion(conf_mat, names(models)),
    pattern = map(conf_mat, models),
    iteration = "list"
  ),
  tar_target(
    importance_plot,
    plot_feature_importance(trained_model, names(models)),
    pattern = map(trained_model, models),
    iteration = "list"
  ),

  # Render Quarto report
  tar_render(report, "report.qmd")
)

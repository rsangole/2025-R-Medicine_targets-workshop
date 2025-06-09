plot_confusion <- function(conf_mat, model_name) {
  conf_mat |>
    autoplot(type = "heatmap") +
    labs(title = paste("Confusion Matrix:", model_name)) +
    theme_minimal()
}

plot_feature_importance <- function(workflow, model_name) {
  if (workflow$fit$fit$spec$engine == "ranger") {
    stopifnot(workflows::is_trained_workflow(workflow))
    workflow |>
      extract_fit_parsnip() |>
      vip::vi() |>
      ggplot(aes(
        x = reorder(Variable, Importance),
        y = Importance
      )) +
      geom_col(fill = "#1f77b4") +
      coord_flip() +
      labs(
        title = paste("Feature Importance:", model_name),
        x = "Feature", y = "Importance"
      ) +
      theme_minimal()
  } else {
    NULL
  }
}

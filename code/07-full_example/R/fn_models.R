split_data <- function(data) {
  initial_split(data, prop = 0.8, strata = cut)
}

create_recipe <- function(data) {
  recipe(
    cut ~ carat + color + clarity + depth + table + price + x + y + z,
    data = data
  ) |>
    step_normalize(all_numeric_predictors()) |>
    step_dummy(all_nominal_predictors(), one_hot = FALSE)
}


train_model <- function(model_spec, recipe, train_data) {
  workflow() |>
    add_recipe(recipe) |>
    add_model(model_spec) |>
    fit(data = train_data)
}

evaluate_model <- function(models, workflow, test_data) {
  test_data |>
    bind_cols(predict(workflow, test_data)) |>
    metrics(truth = cut, estimate = .pred_class) |>
    dplyr::filter(.metric == "accuracy") |>
    dplyr::select(.metric, .estimate) |>
    dplyr::mutate(
      model_name = names(models),
      .before = 1
    )
}

confusion_matrix <- function(workflow, test_data) {
  test_data |>
    bind_cols(predict(workflow, test_data)) |>
    conf_mat(truth = cut, estimate = .pred_class)
}

pipe_models <- list(
  tar_target(data_split, split_data(clean_data)),
  tar_target(train_data, training(data_split)),
  tar_target(test_data, testing(data_split)),
  tar_target(prep_recipe, create_recipe(clean_data)),

  # Model definitions
  tar_target(
    models,
    list(
      rf = rand_forest(trees = 100, mode = "classification") |>
        set_engine("ranger", importance = "impurity"),
      rf500 = rand_forest(trees = 500, mode = "classification") |>
        set_engine("ranger", importance = "impurity")
      # logreg_p01 = multinom_reg(penalty = 0.1, mode = "classification") |>
      #   set_engine("glmnet"),
      # logreg_p05 = multinom_reg(penalty = 0.5, mode = "classification") |>
      #   set_engine("glmnet"),
      # nnet_spec = mlp(epochs = 1000, hidden_units = 10, penalty = 0.01, learn_rate = 0.1) %>%
      #   set_engine("brulee", validation = 0) %>%
      #   set_mode("classification")
    )
  ),

  # Train models (dynamic branching)
  tar_target(
    trained_model,
    train_model(
      model_spec = models[[1]],
      recipe = prep_recipe,
      train_data = train_data
    ),
    pattern = map(models),
    iteration = "list"
  ),

  # Evaluate models
  tar_target(
    model_metrics,
    evaluate_model(models, trained_model, test_data),
    pattern = map(models, trained_model)
  ),

  # Confusion matrices
  tar_target(
    conf_mat,
    confusion_matrix(trained_model, test_data),
    pattern = map(trained_model),
    iteration = "list"
  )
)

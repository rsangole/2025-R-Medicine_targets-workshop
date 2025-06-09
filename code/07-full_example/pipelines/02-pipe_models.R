pipe_models <- list(
  tar_target(data_split, split_data(clean_data)),
  tar_target(train_data, training(data_split)),
  tar_target(test_data, testing(data_split)),
  tar_target(prep_recipe, create_recipe(clean_data)),

  # Model definitions
  tar_target(models, define_models()),

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
    evaluate_model(trained_model, test_data),
    pattern = map(trained_model)
  ),

  # Confusion matrices
  tar_target(
    conf_mat,
    confusion_matrix(trained_model, test_data),
    pattern = map(trained_model),
    iteration = "list"
  )
)

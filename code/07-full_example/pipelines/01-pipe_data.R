pipe_data <- list(
  # Data loading and preprocessing
  tar_target(raw_data, load_diamonds()),
  tar_target(clean_data, preprocess_data(raw_data))
)

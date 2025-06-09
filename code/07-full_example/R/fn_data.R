load_diamonds <- function() {
  ggplot2::diamonds
}

preprocess_data <- function(data) {
  data |>
    dplyr::mutate(
      color = as.factor(color),
      clarity = as.factor(clarity),
      cut = as.factor(cut)
    ) |>
    dplyr::filter(!is.na(carat), !is.na(price))
}

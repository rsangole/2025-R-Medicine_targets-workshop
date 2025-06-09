# 01-basics

**Summary:**  
This folder introduces the fundamental concepts of the `targets` package, including how to define and run a simple pipeline.

**Key Learnings:**
- Understand the structure of a `_targets.R` pipeline file.
- Learn how to define targets and set pipeline options.
- Run a pipeline using `tar_make()`
- Visualize a basic pipeline using `tar_visnetwork()`
- Inspect target outputs using `tar_read()` and `tar_load()`
- Understand how errors affect pipelines

# Exercise

*Add a data transformation and visualization step.*

- Add a new target that creates a new variable in `tbl_clean` (e.g., BMI category: "Underweight", "Normal", "Overweight", "Obese" based on BMI).
- Add another target that creates a bar plot of the counts in each BMI category using `ggplot2`.
- Visualize the updated pipeline with `tar_visnetwork()`.
- Run the pipeline and use `tar_read()` to inspect your new targets.

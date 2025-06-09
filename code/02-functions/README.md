# 02-functions

**Summary:**  
This section demonstrates how to modularize your workflow by writing and using custom R functions within your pipeline.

**Key Learnings:**

- Write reusable functions in a separate script (e.g., `functions.R`).
- Source functions into your pipeline for cleaner, more maintainable code.
- Apply custom functions to targets for data transformation and analysis.


# Exercise

*Add a data transformation and visualization step.*

-   Add a new target called `tbl_counts` which counts the number of rows in `tbl_clean` by `c("gender", "education")`
-   Add another target `plot_bar` that creates a bar plot of the counts 
-   Visualize the updated pipeline with `tar_visnetwork()`
-   Run the pipeline and use `tar_read()` to inspect your new targets
-   What happens if you add some white spaces or comments in a function like `fn_plot_scatter()`? Does targets re-run the pipeline?
-   Try to change the function to force downstream targets to be invalidated. Confirm using `tar_visnetwork()` or `tar_outdated()`.
-   Try introducing an error in one of the functions or targets. What happens? Can you visualize the error in the network?

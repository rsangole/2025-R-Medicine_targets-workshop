# 06-databases

**Summary:**  
This section covers integrating databases into your pipeline, both for reading and writing data.

**Key Learnings:**
- Connect to and query a database (e.g., SQLite) within targets.
- Write target results back to the database.
- Ensure pipeline reruns only when relevant database tables change.

# Exercise

- Add a new target that reads only rows where `Age > 40` from the SQLite database.
- Use `dplyr::filter()` inside the target code.
- Run the pipeline and inspect the filtered data.

**Challenge:**  

*Write and read from the database within the pipeline.*

- Add a target that writes a summary table (e.g., mean BMI by gender) to a new table in the SQLite database.
- Add another target that reads this summary table back into R and plots the results.
- Ensure the pipeline only re-runs the read if the database table changes.

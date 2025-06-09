# 06-databases

**Summary:**  
This section covers integrating databases into your pipeline, both for reading and writing data.

**Key Learnings:**
- Connect to and query a database (e.g., SQLite) within targets.
- Write target results back to the database.
- Ensure pipeline reruns only when relevant database tables change.

**Additional new concepts introduced:**
- target "triggers" or "cues" (rules that decide whether a target is up to date)
- Age based trigger using: `tarchetypes::tar_age`


# Exercise

*Read from the database within the pipeline.*

- Add a new target `tbl_age_gt_40` that reads only rows where `Age > 40` from the SQLite database.
- Use `dplyr::filter()` inside the target code.
- Run the pipeline and inspect the filtered data.

*Write to the database within the pipeline.*

- Write `tbl_age_gt_40` to a new table called `DATA_GT_AGE_40` in the SQLite database
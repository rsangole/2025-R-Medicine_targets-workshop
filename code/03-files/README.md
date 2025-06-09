# 03-files

**Summary:**  
Here, you’ll learn how to manage file inputs and outputs within a `targets` pipeline, ensuring reproducibility and efficiency.

**Key Learnings:**
- Import data from external files as targets.
- Export target results to files (e.g., CSV, images).
- Use the `"file"` format to track file dependencies and outputs.
- Explore the `_targets` directory
    - `_targets/meta/meta`: Target metadata
    - `_targets/objects/`: One file per target

# Exercise

*Automate the import of multiple data files.*

- Add a new target to `_targets.R` that writes `tbl_means` to `output/tbl_means.csv` using `readr::write_csv()`.
- Set the target’s `format = "file"`.
- Run the pipeline and check that the file is created.
- Ensure the pipeline only re-runs the import if a file changes.

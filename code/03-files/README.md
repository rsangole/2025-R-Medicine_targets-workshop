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

- Add a new target `tbl_means` that computes the mean BMI per gender
- Add a new target `export_tbl_means` that writes `tbl_means` to `output/tbl_means.csv` using `readr::write_csv()`.
- Remember to set the target’s `format = "file"`.
- Run the pipeline and check that the file is created.
- Try making a change in the input file `"data/NHANES.csv`. Perhaps delete a few rows.
- Does targets pickup your change? Does it rerun the pipeline?
- What happens if you remove the `format = "file"` from the `local_file` target? Can you explain the behavior?
# 05-dynamic_branching

**Summary:**  
Learn how to use dynamic branching to efficiently process multiple similar tasks (e.g., by group or file) within your pipeline.

**Key Learnings:**
- Use `pattern = map()` and `pattern = cross()` to create dynamic branches.
- Process multiple groups or files in parallel.
- Aggregate and combine results from dynamic branches.

# Exercise

**Challenge:**  

*Aggregate and summarize dynamic branches.*

- Use dynamic branching to split `tbl_NHANES` by both `gender` and `age_group` (e.g., <40, 40–60, >60).
- For each branch, calculate the mean and standard deviation of `BMI`.
- Add a downstream target that combines all summaries into a single tidy data frame.

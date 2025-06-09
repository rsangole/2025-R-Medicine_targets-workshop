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

- Use dynamic branching to split `tbl_NHANES` by `age_decade`
- For each branch, calculate the mean and standard deviation of `bmi`
- Add a downstream target that combines all summaries into a single tidy data frame

_Strech goal_

- Try creating dynamic branches using `cross` mapping
- Experiment with parameter `iteration = "list"`.
    - What's the impact of removing that setting for `tbl_list_home_edu`, when we `tar_read(tbl_list_home_edu)`?
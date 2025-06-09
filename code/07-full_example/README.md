# 07-full_example

**Summary:**  
A comprehensive example that brings together all previous concepts, including parameterized reporting and advanced workflow management.

**Key Learnings:**
- Build a complete, end-to-end pipeline.
- Learn how to structure a project
- Parameterize reports and automate their generation.
- Combine data import, transformation, modeling, and reporting in a reproducible workflow.

# Exercise

Add a report parameter and re-run the pipeline.

- Edit report.qmd to accept a parameter (e.g., a gender filter).
- Modify the pipeline to pass a value for this parameter using tar_render().
- Run the pipeline and check that the report reflects the parameter.

**Challenge:**  

*Parameterize and automate report generation for multiple groups.*

- Modify `report.qmd` to accept a parameter (e.g., gender).
- Add a dynamic target that renders a separate report for each gender present in your data.
- Check that a report is generated for each group and that each report contains only the relevant data.

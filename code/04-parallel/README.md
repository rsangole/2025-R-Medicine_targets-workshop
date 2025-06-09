# 04-parallel

**Summary:**  
This folder explores how to speed up your pipelines by running targets in parallel, making use of available computing resources.

**Key Learnings:**
- Configure parallel execution in `targets`.
- Understand which targets can be parallelized.
- Learn about the powerful `tar_watch()`.
- Monitor and compare pipeline performance with and without parallelism.

# Exercise

- Add a few new linear model targets to `_targets.R` (e.g., predict `tot_chol` from `age` and `bmi`).
- Use the existing parallel setup to run these new models.
- Check the pipeline graph and run time with `tar_visnetwork()` and `tar_progress()`.
- Convince yourself that parallelism is working
    - Can you notice more workers being used?
    - Do you know where you could monitor R processes?
    - Turn off parallelism and try running the pipeline again.
- How many workers should you allocate to a pipeline? What would some constraining factors be? Shouldn't we just default to as-many-cores-as-possible?
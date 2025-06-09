# 04-parallel

**Summary:**  
This folder explores how to speed up your pipelines by running targets in parallel, making use of available computing resources.

**Key Learnings:**
- Configure parallel execution in `targets`.
- Understand which targets can be parallelized.
- Monitor and compare pipeline performance with and without parallelism.

# Exercise

- Add a few new linear model target to `_targets.R` (e.g., predict `totchol` from `age` and `bmi`).
- Use the existing parallel setup to run this new model.
- Check the pipeline graph and run time with `tar_visnetwork()` and tar_progress().
- Convince yourself that parallelism is working
    - Can you notice more cores being used?
    - Do you know where you could monitor R processes?
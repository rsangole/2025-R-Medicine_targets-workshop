# The power of `{targets}` for reproducible data science

[_2025 R/Medicine Conference_](https://rconsortium.github.io/RMedicine_website/)

## Workshop Introduction

Reproducibility is a cornerstone of credible and robust data science. This workshop introduces the powerful `{targets}` package in R, which streamlines and enhances reproducibility in data science workflows. You’ll learn how to build, manage, and scale analytical pipelines that are efficient, transparent, and easy to maintain.

The `{targets}` package provides a comprehensive framework for pipeline management, enabling efficient dependency tracking, automated execution, and clear documentation of your entire analysis process. By the end of this session, you’ll be equipped to apply these tools to your own projects—from data import and cleaning, to modeling, visualization, and reporting.


## Learning Objectives

- **Understand** the core concepts of the `{targets}` package and reproducible pipelines.
- **Build** and run basic and advanced pipelines for data analysis.
- **Modularize** code using custom functions and external scripts.
- **Manage** file inputs/outputs and integrate with Quarto for reporting.
- **Leverage** parallel computing and dynamic branching for scalable workflows.
- **Integrate** databases into your pipeline for robust data management.
- **Visualize** and debug pipelines using built-in tools.



## Agenda

| Time       | Segment                              | Duration | Description                                                      |
|------------|--------------------------------------|----------|------------------------------------------------------------------|
| 0:00–0:15  | Introduction & Setup                 | 15 min   | Overview, objectives, setup check (R, RStudio, packages).        |
| 0:15–0:45  | Lecture: Reproducibility & {targets} | 30 min   | Why reproducibility matters; {targets} concepts (pipelines, dependencies). |
| 0:45–1:15  | Live Demo: Basic {targets} Pipeline  | 30 min   | Build a simple pipeline with a clinical dataset.                 |
| 1:15–1:25  | Break                                | 10 min   | Short stretch break.                                             |
| 1:25–2:05  | Hands-On Exercise 1                  | 40 min   | Participants build a pipeline with provided dataset and code template. |
| 2:05–2:35  | Lecture & Demo: Advanced Features    | 30 min   | Dynamic branching, parallel computing, error handling.           |
| 2:35–2:45  | Break                                | 10 min   | Second break.                                                    |
| 2:45–3:15  | Hands-On Exercise 2                  | 30 min   | Extend pipeline with advanced features (e.g., branching).        |
| 3:15–3:30  | Wrap-Up & Q&A                        | 15 min   | Recap, share resources, answer questions, discuss next steps.    |

## Setup Prerequisites

- R and RStudio installed
- Clone this repo locally
- Run `renv::restore()` to install all the needed packages
- For Mac users, you may also have to install these dependencies:
    - `brew install mbedtls`
    - `brew install cmake`


## Workshop Sequence

The workshop is structured to build your skills step-by-step, from foundational concepts to advanced features:

### Fundamentals
1. **01-basics**  
   *Get started with the core concepts of `{targets}` and build your first pipeline.*

2. **02-functions**  
   *Modularize your workflow by writing and sourcing custom functions for use in your pipeline.*

3. **03-files**  
   *Handle file inputs and outputs, and integrate Quarto documents for automated reporting.*


---

### Advanced Topics

4. **04-parallel**  
   *Accelerate your pipelines by leveraging parallel computing for faster execution.*

5. **05-dynamic_branching**  
   *Scale your analysis with dynamic branching to process multiple groups or files efficiently.*

6. **06-database**  
   *Integrate databases into your workflow for robust and scalable data management.*

7. **07-full_example**  
   *A comprehensive example that brings together all previous concepts, including parameterized reporting and advanced workflow management.*


---

Each section includes hands-on exercises and examples to reinforce your learning.
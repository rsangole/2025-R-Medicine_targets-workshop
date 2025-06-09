![Static Badge](https://img.shields.io/badge/Workshop%20-%202025%20R%2FMedicine%20Conference%20-%20darkgreen) ![Static Badge](https://img.shields.io/badge/Topic%20-%20{targets}%20-%20maroon)

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

## Workshop Agenda


| Time       | Segment                                      | Duration | Description                                                      |
|------------|----------------------------------------------|----------|------------------------------------------------------------------|
| 0:00–0:15  | Introduction & Setup                         | 15 min   | Welcome, objectives, environment check, intro to `{targets}`.    |
| 0:15–0:35  | 01-basics: Core Concepts Exercise            | 20 min   | Build your first `{targets}` pipeline.                           |
| 0:35–0:55  | 02-functions: Modularization Exercise        | 20 min   | Write and source custom functions for your pipeline.             |
| 0:55–1:05  | **Break**                                    | 10 min   | Stretch, coffee, questions.                                      |
| 1:05–1:25  | 03-files: File I/O & Quarto Exercise         | 20 min   | Handle file inputs/outputs and automate reporting.               |
| 1:25–1:45  | 04-parallel: Parallel Computing Exercise     | 20 min   | Speed up pipelines with parallel computing.                      |
| 1:45–1:55  | **Break**                                    | 10 min   | Stretch, coffee, questions.                                      |
| 1:55–2:10  | 05-dynamic_branching: Dynamic Branching Ex.  | 15 min   | Process multiple groups/files efficiently.                       |
| 2:10–2:25  | 06-database: Database Integration Exercise   | 15 min   | Integrate databases for robust data management.                  |
| 2:25–2:35  | **Break**                                    | 10 min   | Stretch, coffee, questions.                                      |
| 2:35–2:45  | 07-full_example: Full Pipeline Exercise      | 10 min   | Bring together all concepts in a comprehensive example.          |
| 2:45–3:00  | Wrap-Up and Q&A                              | 15 min   | Recap, resources, open questions, next steps.                    |


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
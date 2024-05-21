
# Description

This repository contains the documentation for reproducibility of the study ***"Indoor dust microbiota composition and allergic diseases: a scoping review"***. 

## Getting started

IN PROGRESS

Although I have made significant efforts to ensure reproducibility of this project, I encourage you to contact ([contact me](mailto:j.mancillagalindo@uu.nl)) or post a request in this repository in case you encounter any issues.   

## Project Structure

The project structure distinguishes three kinds of folders:
- read-only (RO): not edited by either code or researcher
- human-writeable (HW): edited by the researcher only.
- project-generated (PG): folders generated when running the code; these folders can be deleted or emptied and will be completely reconstituted as the project is run.

```         
.
├── .gitignore
├── CITATION.cff
├── LICENSE
├── README.md
├── Dust-Microbiome-Review.Rproj
├── data                  <- All project data files
│   ├── processed         <- The final, canonical data sets. (PG)
│   ├── raw               <- The original, immutable data. (RO)
│   └── temp              <- Intermediate data that has been transformed. (PG)
├── docs                  <- Documentation for users (HW)
│   ├── manuscript        <- Manuscript source, docx. (HW)
│   ├── presentations     <- Powerpoint presentations, pptx. (HW)
│   ├── reports           <- Project reports, pdf. (HW)
│   └── DAG               <- Directed Acyclic Graph documentation, txt. (HG)
├── results
│   ├── output_figures    <- Figures for the manuscript or reports (PG)
│   └── output_tables     <- Output tables for the manuscript (PG)
└── R                     <- Source code for this project (HW)
│   ├── scripts           <- Scripts sourced in main R markdown documents (PG)
│   └── sessions          <- Text files with information of R sessions (PG)
└── renv                  <- Packaging dependencies (RO)
```

## Documentation

The full documentation with comments of statistical analyses can be found in the [reports folder](docs/reports). These reports describe the operating system of R and package versions dependencies to reproduce each part of the analyses. I ***will include*** package dependencies in the **renv** folder in a lockfile. 

## License

This project is licensed under the terms of the [MIT License](/LICENSE).

This project structure template repository is adapted from the [Good Enough Project](https://github.com/bvreede/good-enough-project) Cookiecutter template by Barbara Vreede (2019).



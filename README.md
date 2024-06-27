
# Description

This repository contains the documentation for reproducibility of the study ***"Indoor dust microbiota composition and allergic diseases: a scoping review to produce a reusable DAG"***.  

This study has been presented at:
-   Weekly [department](https://www.uu.nl/en/organisation/faculty-of-veterinary-medicine/about-the-faculty/departments/iras) meeting on 28/05/2024. [Slides](docs/presentations/presentation-iras-28_05_2024.pdf) 
-   [Veterinary Science Day](https://veterinaryscienceday.nl/) on 06/06/2024. [Poster](docs/presentations/poster-VSD-06_06_2024.pdf)

You can [contact me](mailto:j.mancillagalindo@uu.nl) or post a request on this repository in case you encounter any issues, or if you'd like to discuss or ask a question on how to use this resource.   

## Getting started

In order to replicate these analyses, I suggest that the user follows these steps:
1. Install [R and RStudio](https://posit.co/download/rstudio-desktop/) on your computer if you haven't done so. (Note that analyses described between part 1 and 4 were conducted under R version 4.4.0 and RStudio 2024.04.1, while analyses in part 5 and 6 were done in R version 4.2.2).
2. [Clone this repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository). If you do not know how to do this, [you can follow these instructions](https://docs.github.com/en/desktop/overview/getting-started-with-github-desktop). Alternatively, you can [download this repository](https://github.com/javimangal/Dust-Microbiome-Review/archive/refs/heads/main.zip), unpack it, and place it in a folder in your computer.
3. You should now have all these files in your computer with an identical folder structure (described in the following section).
4. In the main directory, open the file named ***Dust-Microbiome-Review.Rproj*** in RStudio.
5. You can navigate through the folders on the right-bottom panel of R Studio. Open the **R** folder. You should now see a series of files ending with ***.qmd***.
6. Open one of these files. You can run every chunk of code sequentially to reproduce the analyses. Make sure to respect the order and if something fails, I recommend that you start running al chunks of code from the beginning. If you don't know how to run a chunk of code, you can [imitate what this person is doing](https://youtu.be/RPF6gGyeJmg?feature=shared&t=30). If you get a message saying "Access denied", change from *Visual* to *Source* mode which can be done with the Ctrl+Shift+F4 command. NOTE: R scripts in the [scripts folder](R/scripts) are sourced into the main qmd files, reason why they are not meant to be used individually within this project. 

I recommend that the **.qmd** files are opened and ran in sequential order, although some may only be interested in one of the parts of the analyses. If you are not able to follow the prior steps, you may also consider reviewing the [PDF reports](docs/reports) documenting the analyses. The suggested sequence for reviewing the flow of analysis is the following:

-   [Part 1](R/Data_preparation.qmd). Preparation of data and saving into formats readable by other statistical software (.csv, .dta, .sav, .xpt) for greater reusability. [PDF](docs/reports/Data_preparation.pdf)
-   [Part 2](R/Descriptive_analysis.qmd). Descriptive analyses. [PDF](docs/reports/Descriptive_analysis.pdf)
-   [Part 3](R/ESC-DAG_cited_by.qmd). Analysis of studies citing the [ESC-DAG method](https://pubmed.ncbi.nlm.nih.gov/31325312/) in the last two years. [PDF](docs/reports/ESC-DAG_cited_by.pdf)
-   [Part 4](R/Implied_graphs.qmd). Mapping procedure, for the reconstruction of implied graphs from studies assessing the relationship between the indoor dust microbiome and allergic diseases. [PDF](docs/reports/Implied_graphs.pdf)
-   [Part 5](R/Microbiome_pooled_analysis_bacteria.qmd). Pooled analysis of the indoor dust bacterial microbiome of 5 studies included in the review plus priorly unpublished data from households in the Netherlands. [PDF](docs/reports/Microbiome_pooled_analysis_bacteria.pdf)
-   [Part 6](R/Microbiome_pooled_analysis_fungi.qmd). Pooled analysis of the indoor dust fungal microbiome of 3 studies included in the review plus priorly unpublished data from households in the Netherlands. [PDF](docs/reports/Microbiome_pooled_analysis_fungi.pdf)

Note: I have not provided data for reproducibility of parts 5 and 6 in this repository since this still needs to be discussed internally to decide the best way to share the corresponding data. 

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
├── results
│   ├── output_figures    <- Figures for the manuscript or reports (PG)
│   └── output_tables     <- Output tables for the manuscript (PG)
└── R                     <- Source code for this project (HW)
│   ├── scripts           <- Scripts sourced in main R markdown documents (PG)
│   └── sessions          <- Text files with information of R sessions (PG)
└── renv                  <- Packaging dependencies (RO)
```

## Documentation

The full documentation with comments of statistical analyses can be found in the [reports folder](docs/reports). These reports describe the operating system of R and package versions dependencies to reproduce each part of the analyses. I ***will include*** package dependencies in the **renv** folder in a lockfile later on. 

## License

This project is licensed under the terms of the [MIT License](/LICENSE).

This project structure template repository is adapted from the [Good Enough Project](https://github.com/bvreede/good-enough-project) Cookiecutter template by Barbara Vreede (2019).


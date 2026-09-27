# Run from the project folder in the RStudio Console:
# source("R/run_analysis.R")
# The same file is sourced by report.qmd when you click Render.

source("R/01_load_clean.R", local = TRUE)
source("R/02_summarize.R", local = TRUE)
source("R/03_models.R", local = TRUE)
source("R/04_plots.R", local = TRUE)

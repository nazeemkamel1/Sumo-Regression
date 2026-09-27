# Sumo regression

Author: Nazeem Kamel  
Draft date: September 26, 2026

## Project files

- `report.qmd`: report text, table formatting, and short calls that display figures.
- `R/run_analysis.R`: runs the scripts below in order.
- `R/01_load_clean.R`: downloads/reads the CSV, cleans names and dates, calculates BMI and winning percentage, and filters appearances.
- `R/02_summarize.R`: groups by ring name and birth date, calculates averages, and prepares the table.
- `R/03_models.R`: fits the BMI and weight regressions, with and without single-appearance groups.
- `R/04_plots.R`: creates the scatterplots and the function for diagnostic plots.
- `report.pdf` and `report.html`: rendered reports.
- `.gitignore`: keeps downloaded data and temporary files out of Git.

## Run in RStudio

Keep `report.qmd` and the `R` folder together in the project folder. Open the existing RStudio project. Open `report.qmd` and click Render for HTML, or select Render PDF from the Render menu. PDF rendering requires a LaTeX installation.

To run the analysis without rendering, enter this in the RStudio Console:

```r
source("R/run_analysis.R")
summary(weight_2plus)
confint(weight_2plus)
```

Enter `weight_plot` or `bmi_plot` to view a scatterplot, or `plot_weight_diagnostics()` to view the diagnostic plots. Run the scripts from the project root, not from inside the `R` folder.

Required R packages: dplyr, readr, stringr, ggplot2, broom, knitr, and rmarkdown. Quarto is used to render the report.

## Data

Source: Fay, Jack, A. J. Dykstra, and Ivan Ramler (2023), *Sumo wrestler characteristics*, SCORE Sports Data Repository: https://data.scorenetwork.org/wrestling/sumo_wrestingling_since_1957.html.



## External assistance

ChatGPT/Codex assisted with R debugging, formatting the report, and separating the analysis into scripts. The ReadMe was structured and formatted with Codex assistance.

# Read the original data and retain appearances with 15 recorded results.

library(dplyr)
library(readr)
library(stringr)

# Default: reuse or download the data inside the RStudio project.
# An optional environment variable permits rendering against an existing copy.
data_file <- Sys.getenv("SUMO_DATA_FILE", unset = "data/sumo_since_1957.csv")
if (!file.exists(data_file)) {
  dir.create(dirname(data_file), recursive = TRUE, showWarnings = FALSE)
  download.file(
    "https://data.scorenetwork.org/data/sumo_since_1957.csv",
    destfile = data_file,
    mode = "wb"
  )
}

sumo_raw <- read_csv(data_file, show_col_types = FALSE)
sumo_clean <- sumo_raw |>
  mutate(
    Rikishi = str_squish(Rikishi),
    birth_date = as.Date(.data[["Birth Date"]], format = "%d.%m.%Y"),
    height_m = height_cm / 100,
    bmi = if_else(
      is.finite(weight_kg) & weight_kg > 0 &
        is.finite(height_m) & height_m > 0,
      weight_kg / height_m^2,
      NA_real_
    ),
    recorded_bouts = wins + losses
  )

analysis_fields <- c("Rikishi", "birth_date", "weight_kg", "height_cm", "wins", "losses", "bmi")
missing_cells <- sum(is.na(sumo_clean[analysis_fields]))
stopifnot(missing_cells == 0L)

sumo_15 <- sumo_clean |>
  filter(recorded_bouts == 15) |>
  mutate(win_pct = 100 * wins / recorded_bouts)

